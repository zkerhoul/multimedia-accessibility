import sys
import os
import locale
import ctypes
import ctypes.util
import numpy as np
import sounddevice as sd
import soundfile as sf

# Must set LC_NUMERIC to "C" at the C level before importing mpv,
# otherwise libmpv segfaults on macOS with non-C locales.
locale.setlocale(locale.LC_NUMERIC, 'C')
libc = ctypes.CDLL(ctypes.util.find_library('c'))
libc.setlocale(ctypes.c_int(4), b'C')  # LC_NUMERIC = 4 on macOS

import mpv

from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout,
    QPushButton, QLabel, QSlider, QFileDialog,
    QSizePolicy, QScrollArea
)
from PyQt6.QtCore import Qt, QTimer
from PyQt6.QtOpenGLWidgets import QOpenGLWidget

from max_bridge import MaxBridge
from nine_band_eq_dialog import get_final_gains


def _get_process_address(_, name):
    """Callback for mpv to resolve OpenGL function addresses."""
    path = ctypes.util.find_library("OpenGL")
    if not path:
        return 0
    lib = ctypes.cdll.LoadLibrary(path)
    try:
        return ctypes.cast(getattr(lib, name.decode('utf-8')), ctypes.c_void_p).value or 0
    except AttributeError:
        return 0

get_process_address = mpv.MpvGlGetProcAddressFn(_get_process_address)


class MpvContainer(QOpenGLWidget):
    """A QOpenGLWidget that hosts an embedded mpv player via the render API."""

    def __init__(self, parent=None):
        super().__init__(parent)
        self.player = None
        self._render_ctx = None

    def init_mpv(self):
        self.player = mpv.MPV(
            vo='libmpv',
            aid='no',
            keep_open='yes',
            osd_level=0,
            input_default_bindings=False,
            input_vo_keyboard=False,
            log_handler=print,
            loglevel='info',
        )
        self.player['sub-visibility'] = True
        self.player['sub-auto'] = 'fuzzy'

    def initializeGL(self):
        if self.player and not self._render_ctx:
            self._render_ctx = mpv.MpvRenderContext(
                self.player, 'opengl',
                opengl_init_params={
                    'get_proc_address': get_process_address,
                }
            )
            self._render_ctx.update_cb = self._on_render_update

    def _on_render_update(self):
        # Schedule a repaint on the Qt thread
        QTimer.singleShot(0, self.update)

    def paintGL(self):
        if self._render_ctx:
            ratio = self.devicePixelRatioF()
            w = int(self.width() * ratio)
            h = int(self.height() * ratio)
            fbo = self.defaultFramebufferObject()
            self._render_ctx.render(flip_y=True, opengl_fbo={
                'w': w, 'h': h, 'fbo': fbo,
            })

    def closeEvent(self, event):
        if self._render_ctx:
            self._render_ctx.free()
            self._render_ctx = None
        super().closeEvent(event)


class AVMixer(QWidget):
    def __init__(self, output_device=None):
        super().__init__()
        self.setWindowTitle("Mixer → Max (DX, MX, SFX)")
        self.resize(1000, 600)

        self.pre_eq_gains = None
        self.audio_buffers = {}
        self.running = False
        self.stream = None
        self.sliders = {}
        self.video_path = None
        self.subtitle_path = None

        self.stem_types = ["dx", "mx", "sfx"]
        self.stem_labels = {"dx": "Dialogue", "mx": "Music", "sfx": "Sound Effects"}
        self.track_channels = {
            "dx": (0, 1),
            "mx": (2, 3),
            "sfx": (4, 5),
        }

        # OSC bridge to Max
        self.max_bridge = MaxBridge(send_port=8000, listen_port=8001)
        self.max_bridge.start_server()

        self.output_device = output_device
        self.init_ui()

        QTimer.singleShot(100, self.start_pre_eq_phase)

    def init_ui(self):
        main_layout = QHBoxLayout()
        self.setLayout(main_layout)

        # left side — embedded mpv video player (OpenGL)
        self.mpv_widget = MpvContainer()
        self.mpv_widget.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        self.mpv_widget.init_mpv()
        main_layout.addWidget(self.mpv_widget, stretch=2)

        # right side control panel
        controls_layout = QVBoxLayout()

        # control buttons
        load_button = QPushButton("Load Video/Audio")
        load_subs_button = QPushButton("Load Subtitles (.srt)")
        pre_eq_button = QPushButton("Re-open 9-Band Pre-EQ")
        play_button = QPushButton("Play")
        stop_button = QPushButton("Stop")

        h_controls = QHBoxLayout()
        h_controls.addWidget(load_button)
        h_controls.addWidget(load_subs_button)
        h_controls.addWidget(pre_eq_button)
        h_controls.addWidget(play_button)
        h_controls.addWidget(stop_button)
        controls_layout.addLayout(h_controls)

        # track controls
        for t in self.stem_types:
            controls_layout.addWidget(QLabel(f"--- {self.stem_labels[t]} ---"))
            self.sliders[t] = {}

            # volume and pan
            h_vp = QHBoxLayout()
            vol = QSlider(Qt.Orientation.Horizontal)
            vol.setRange(0, 100)
            vol.setValue(75)
            vol_label = QLabel("75")

            pan = QSlider(Qt.Orientation.Horizontal)
            pan.setRange(-100, 100)
            pan.setValue(0)
            pan_label = QLabel("0")

            vol.valueChanged.connect(
                lambda v, l=vol_label, name=t: (l.setText(str(v)), self.request_coeff_update(name))
            )
            pan.valueChanged.connect(
                lambda v, l=pan_label, name=t: (l.setText(str(v)), self.request_coeff_update(name))
            )

            h_vp.addWidget(QLabel("Vol"))
            h_vp.addWidget(vol)
            h_vp.addWidget(vol_label)
            h_vp.addWidget(QLabel("Pan"))
            h_vp.addWidget(pan)
            h_vp.addWidget(pan_label)
            controls_layout.addLayout(h_vp)

            # eq controls
            h_eq = QHBoxLayout()
            low_gain = QSlider(Qt.Orientation.Horizontal)
            mid_gain = QSlider(Qt.Orientation.Horizontal)
            high_gain = QSlider(Qt.Orientation.Horizontal)

            for s in (low_gain, mid_gain, high_gain):
                s.setRange(-12, 12)
                s.setValue(0)

            low_label, mid_label, high_label = QLabel("0"), QLabel("0"), QLabel("0")

            for s, lbl in [
                (low_gain, low_label),
                (mid_gain, mid_label),
                (high_gain, high_label),
            ]:
                s.valueChanged.connect(
                    lambda v, l=lbl, name=t: (l.setText(f"{v:+d}"), self.request_coeff_update(name))
                )

            h_eq.addWidget(QLabel("Low (+/-12dB)"))
            h_eq.addWidget(low_gain)
            h_eq.addWidget(low_label)
            h_eq.addWidget(QLabel("Mid (+/-12dB)"))
            h_eq.addWidget(mid_gain)
            h_eq.addWidget(mid_label)
            h_eq.addWidget(QLabel("High (+/-12dB)"))
            h_eq.addWidget(high_gain)
            h_eq.addWidget(high_label)
            controls_layout.addLayout(h_eq)

            # frequency shifter section
            h_fs = QHBoxLayout()
            freq_shift = QSlider(Qt.Orientation.Horizontal)
            freq_shift.valueChanged.connect(lambda _, name=t: self.request_coeff_update(name))
            freq_shift.setRange(-50, 50)
            freq_shift.setValue(0)

            label_min = QLabel("Shift Down")
            label_max = QLabel("Shift Up")

            h_fs.addWidget(label_min)
            h_fs.addWidget(freq_shift)
            h_fs.addWidget(label_max)
            controls_layout.addLayout(h_fs)

            # reset buttons
            reset_button = QPushButton("Reset")
            reset_button.clicked.connect(lambda _, name=t: self.reset_params(name))
            controls_layout.addWidget(reset_button)

            # references
            self.sliders[t] = {
                "vol": vol,
                "pan": pan,
                "low": low_gain,
                "mid": mid_gain,
                "high": high_gain,
                "freq_shift": freq_shift,
                "labels": {
                    "vol": vol_label,
                    "pan": pan_label,
                    "low": low_label,
                    "mid": mid_label,
                    "high": high_label,
                },
            }

        # make the right side scrollable
        scroll_area = QScrollArea()
        scroll_area.setWidgetResizable(True)
        control_container = QWidget()
        control_container.setLayout(controls_layout)
        scroll_area.setWidget(control_container)

        main_layout.addWidget(scroll_area, stretch=2)

        # button signals
        load_button.clicked.connect(self.load_video_and_audio)
        load_subs_button.clicked.connect(self.load_subtitles)
        pre_eq_button.clicked.connect(self.start_pre_eq_phase)
        play_button.clicked.connect(self.start_all)
        stop_button.clicked.connect(self.stop_all)

    def start_pre_eq_phase(self):
        self.stop_all()
        gains = get_final_gains(self)
        if gains is not None:
            self.pre_eq_gains = gains
            print("9-Band Pre-EQ settings accepted.")
            self.max_bridge.send_pre_eq(gains)
        else:
            print("9-Band Pre-EQ cancelled.")

    def reset_params(self, track_name):
        sliders = self.sliders[track_name]
        sliders["vol"].setValue(75)
        sliders["pan"].setValue(0)
        sliders["low"].setValue(0)
        sliders["mid"].setValue(0)
        sliders["high"].setValue(0)
        sliders["freq_shift"].setValue(0)
        self.request_coeff_update(track_name)
        print(f"{track_name} reset to defaults.")

    def request_coeff_update(self, track_name):
        s = self.sliders[track_name]
        vol = float(s["vol"].value()) / 100.0
        pan = float(s["pan"].value()) / 100.0
        low = float(s["low"].value())
        mid = float(s["mid"].value())
        high = float(s["high"].value())
        freq_shift_val = (float(s["freq_shift"].value()) + 100.0) / 200.0
        self.max_bridge.send_track_control(track_name, vol, pan, low, mid, high, freq_shift_val)

    def load_video_and_audio(self):
        media_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "media")
        if not os.path.isdir(media_dir):
            media_dir = ""

        video_path, _ = QFileDialog.getOpenFileName(
            self, "Select Video File", media_dir, "Video Files (*.mov *.mp4 *.avi)"
        )
        if not video_path:
            return

        self.stop_all()
        self._cleanup_stream()
        self.video_path = video_path
        self.subtitle_path = None
        self.audio_buffers = {}

        # Auto-detect matching .srt subtitle file
        base, _ = os.path.splitext(video_path)
        for ext in ('.srt', '.ass', '.vtt'):
            sub_path = base + ext
            if os.path.exists(sub_path):
                self.subtitle_path = sub_path
                print(f"Subtitles auto-detected: {sub_path}")
                break

        # Derive audio stem paths from the video filename prefix
        # e.g., media/wildrobot.mp4 -> media/wildrobot-dx.wav, wildrobot-mx.wav, ...
        video_dir = os.path.dirname(video_path)
        prefix = os.path.splitext(os.path.basename(video_path))[0]

        for stem in self.stem_types:
            audio_path = os.path.join(video_dir, f"{prefix}-{stem}.wav")
            try:
                data, sr = sf.read(audio_path, always_2d=True)
                if data.ndim == 1:
                    data = np.repeat(data[:, None], 2, axis=1)
                if data.shape[1] == 1:
                    data = np.repeat(data, 2, axis=1)
                if data.shape[1] > 2:
                    data = data[:, :2]
                self.audio_buffers[stem] = {"data": data.astype(np.float32), "sr": sr, "idx": 0}
                print(f"Loaded: {prefix}-{stem}.wav")
            except Exception as e:
                print(f"Warning: could not load {prefix}-{stem}.wav: {e}")

        if self.audio_buffers:
            srs = {v["sr"] for v in self.audio_buffers.values()}
            if len(srs) != 1:
                print("WARNING: Not all audio files share the same samplerate. Resample them for reliable playback.")
            print(f"Video ({prefix}) and {len(self.audio_buffers)} audio tracks loaded.")
        else:
            print("Video loaded, but no audio tracks were found/loaded.")

        # Load video into mpv (paused) so it's visible immediately
        if self.mpv_widget.player:
            self.mpv_widget.player.command('loadfile', video_path)
            self.mpv_widget.player.pause = True
            if self.subtitle_path:
                QTimer.singleShot(200, self._add_subtitles)

    def load_subtitles(self):
        path, _ = QFileDialog.getOpenFileName(
            self, "Select Subtitle File", "", "Subtitle Files (*.srt *.ass *.sub *.vtt)"
        )
        if path:
            self.subtitle_path = path
            if self.mpv_widget.player:
                try:
                    self.mpv_widget.player.command('sub-add', path, 'select')
                except Exception as e:
                    print(f"Error loading subtitles: {e}")
            print(f"Subtitles loaded: {path}")

    def audio_callback(self, outdata, frames, time_info, status):
        if status:
            print(f"Stream status: {status}", file=sys.stderr)
        blocksize = frames
        nch = 6
        mixed = np.zeros((blocksize, nch), dtype=np.float32)

        if not self.running or not self.audio_buffers:
            outdata[:] = np.zeros_like(outdata)
            return

        for name, buf in self.audio_buffers.items():
            data = buf["data"]
            idx = buf["idx"]
            if idx + blocksize > len(data):
                wrap_len = len(data) - idx
                chunk = np.zeros((blocksize, 2), dtype=np.float32)
                chunk[:wrap_len] = data[idx:]
                chunk[wrap_len:] = data[:blocksize - wrap_len]
                buf["idx"] = blocksize - wrap_len
            else:
                chunk = data[idx:idx + blocksize].copy()
                buf["idx"] = idx + blocksize

            chL, chR = self.track_channels[name]
            mixed[:, chL] = chunk[:, 0]
            mixed[:, chR] = chunk[:, 1]

        outdata[:] = np.clip(mixed, -1.0, 1.0)

    def start_all(self):
        if not self.audio_buffers:
            print("Audio files not loaded. Please load video and audio first.")
            return
        if not self.running:
            for stem in self.stem_types:
                if stem in self.audio_buffers:
                    self.audio_buffers[stem]["idx"] = 0
                self.request_coeff_update(stem)

            if self.pre_eq_gains is not None:
                self.max_bridge.send_pre_eq(self.pre_eq_gains)

            # Seek video to start (while still paused)
            if self.mpv_widget.player and self.video_path:
                self.mpv_widget.player.command('seek', 0, 'absolute')

            # Create audio stream (outputs silence until self.running = True)
            self._cleanup_stream()
            sr = list(self.audio_buffers.values())[0]["sr"]
            try:
                stream = sd.OutputStream(
                    samplerate=sr,
                    blocksize=1024,
                    channels=6,
                    callback=self.audio_callback,
                    dtype="float32",
                    device=self.output_device,
                )
                stream.start()
                self.stream = stream
            except Exception as e:
                print("Failed to start audio stream:", e)
                return

            # Enable audio and unpause video together
            self.running = True
            if self.mpv_widget.player and self.video_path:
                self.mpv_widget.player.pause = False
            print("Playback started.")
            self.max_bridge.send_transport("play")

    def _add_subtitles(self):
        if self.mpv_widget.player and self.subtitle_path:
            try:
                self.mpv_widget.player.command('sub-add', self.subtitle_path, 'select')
            except Exception as e:
                print(f"Error adding subtitles: {e}")

    def stop_all(self):
        if self.running:
            self.running = False
            if self.mpv_widget.player:
                try:
                    self.mpv_widget.player.pause = True
                except Exception:
                    pass
            self._cleanup_stream()
            print("Playback stopped.")
            self.max_bridge.send_transport("stop")

    def _cleanup_stream(self):
        """Fully stop and close the audio stream (for shutdown/reload)."""
        if self.stream:
            try:
                self.stream.stop()
                self.stream.close()
            except Exception:
                pass
            self.stream = None

    def closeEvent(self, event):
        self.stop_all()
        self._cleanup_stream()
        if self.mpv_widget._render_ctx:
            self.mpv_widget._render_ctx.free()
            self.mpv_widget._render_ctx = None
        if self.mpv_widget.player:
            self.mpv_widget.player.terminate()
        self.max_bridge.shutdown()
        super().closeEvent(event)


def main():
    app = QApplication(sys.argv)
    # QApplication resets locale — force it back to C for libmpv
    locale.setlocale(locale.LC_NUMERIC, 'C')
    libc.setlocale(ctypes.c_int(4), b'C')
    win = AVMixer(output_device='BlackHole 64ch')
    win.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
