import sys
import os
import re
import numpy as np
import sounddevice as sd
import soundfile as sf

from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout,
    QPushButton, QLabel, QSlider, QFileDialog,
    QSizePolicy, QScrollArea
)
from PyQt6.QtMultimedia import QMediaPlayer, QAudioOutput
from PyQt6.QtMultimediaWidgets import QVideoWidget
from PyQt6.QtCore import Qt, QUrl, QTimer

from max_bridge import MaxBridge
from nine_band_eq_dialog import get_final_gains


def parse_srt(path):
    """Parse an .srt file and return a list of (start_ms, end_ms, text) tuples."""
    subtitles = []
    with open(path, 'r', encoding='utf-8-sig') as f:
        content = f.read()

    blocks = re.split(r'\n\s*\n', content.strip())
    time_pattern = re.compile(
        r'(\d{2}):(\d{2}):(\d{2})[,.](\d{3})\s*-->\s*(\d{2}):(\d{2}):(\d{2})[,.](\d{3})'
    )

    for block in blocks:
        lines = block.strip().split('\n')
        if len(lines) < 2:
            continue
        for i, line in enumerate(lines):
            match = time_pattern.search(line)
            if match:
                h1, m1, s1, ms1, h2, m2, s2, ms2 = (int(x) for x in match.groups())
                start_ms = h1 * 3600000 + m1 * 60000 + s1 * 1000 + ms1
                end_ms = h2 * 3600000 + m2 * 60000 + s2 * 1000 + ms2
                text = '\n'.join(lines[i + 1:]).strip()
                # Strip basic HTML tags like <i>, <b>, etc.
                text = re.sub(r'<[^>]+>', '', text)
                if text:
                    subtitles.append((start_ms, end_ms, text))
                break

    return subtitles


class VideoContainer(QWidget):
    """A QWidget containing a QVideoWidget with a subtitle label below."""

    def __init__(self, parent=None):
        super().__init__(parent)

        layout = QVBoxLayout()
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)
        self.setLayout(layout)

        self.video_widget = QVideoWidget()
        layout.addWidget(self.video_widget, stretch=1)

        self.subtitle_label = QLabel()
        self.subtitle_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.subtitle_label.setWordWrap(True)
        self.subtitle_label.setMinimumHeight(60)
        self.subtitle_label.setStyleSheet(
            "QLabel {"
            "  color: white;"
            "  font-size: 18px;"
            "  font-weight: bold;"
            "  background-color: black;"
            "  padding: 8px 12px;"
            "}"
        )
        self.subtitle_label.setText("")
        layout.addWidget(self.subtitle_label)

        # Transport controls
        transport_layout = QHBoxLayout()
        transport_layout.setContentsMargins(4, 4, 4, 4)

        self.rewind_btn = QPushButton("<< 5s")
        self.play_pause_btn = QPushButton("Play")
        self.ff_btn = QPushButton("5s >>")

        for btn in (self.rewind_btn, self.play_pause_btn, self.ff_btn):
            btn.setFixedHeight(28)

        self.seek_slider = QSlider(Qt.Orientation.Horizontal)
        self.seek_slider.setRange(0, 0)

        self.time_label = QLabel("0:00 / 0:00")
        self.time_label.setStyleSheet("color: white; font-size: 12px;")
        self.time_label.setFixedWidth(100)
        self.time_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

        transport_layout.addWidget(self.rewind_btn)
        transport_layout.addWidget(self.play_pause_btn)
        transport_layout.addWidget(self.ff_btn)
        transport_layout.addWidget(self.seek_slider, stretch=1)
        transport_layout.addWidget(self.time_label)

        transport_widget = QWidget()
        transport_widget.setLayout(transport_layout)
        transport_widget.setStyleSheet("background-color: #333; color: white;")
        layout.addWidget(transport_widget)


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
        self.subtitles = []
        self.paused = False

        self.stem_types = ["dx", "mx", "sfx"]
        self.stem_labels = {"dx": "Vocals/Dialogue", "mx": "Music", "sfx": "Sound Effects"}
        self.track_channels = {
            "dx": (0, 1),
            "mx": (2, 3),
            "sfx": (4, 5),
        }

        # Qt media player (muted — audio goes through sounddevice → BlackHole → Max)
        self.player = QMediaPlayer()
        self.audio_output = QAudioOutput()
        self.player.setAudioOutput(self.audio_output)
        self.audio_output.setVolume(0.0)

        # OSC bridge to Max
        self.max_bridge = MaxBridge(send_port=8000, listen_port=8001)
        self.max_bridge.start_server()

        # Subtitle update timer
        self._sub_timer = QTimer()
        self._sub_timer.setInterval(50)
        self._sub_timer.timeout.connect(self._update_subtitles)

        self.output_device = output_device
        self.init_ui()

        QTimer.singleShot(100, self.start_pre_eq_phase)

    def init_ui(self):
        main_layout = QHBoxLayout()
        self.setLayout(main_layout)

        # left side — video player with subtitle overlay
        self.video_container = VideoContainer()
        self.video_container.setSizePolicy(
            QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding
        )
        self.player.setVideoOutput(self.video_container.video_widget)
        main_layout.addWidget(self.video_container, stretch=2)

        # Transport bar connections
        self.video_container.play_pause_btn.clicked.connect(self.toggle_play_pause)
        self.video_container.rewind_btn.clicked.connect(lambda: self.seek_relative(-5000))
        self.video_container.ff_btn.clicked.connect(lambda: self.seek_relative(5000))
        self.video_container.seek_slider.sliderMoved.connect(self.seek_to)
        self.player.durationChanged.connect(self._on_duration_changed)

        # right side control panel
        controls_layout = QVBoxLayout()

        # control buttons
        load_button = QPushButton("Load Video/Audio")
        pre_eq_button = QPushButton("Re-open 9-Band Pre-EQ")

        h_controls = QHBoxLayout()
        h_controls.addWidget(load_button)
        h_controls.addWidget(pre_eq_button)
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
        pre_eq_button.clicked.connect(self.start_pre_eq_phase)

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
        self.video_path = video_path
        self.subtitle_path = None
        self.subtitles = []
        self.audio_buffers = {}

        # Auto-detect matching subtitle file
        base, _ = os.path.splitext(video_path)
        for ext in ('.srt', '.ass', '.vtt'):
            sub_path = base + ext
            if os.path.exists(sub_path):
                self.subtitle_path = sub_path
                self.subtitles = parse_srt(sub_path)
                print(f"Subtitles auto-detected: {sub_path} ({len(self.subtitles)} cues)")
                break

        # Derive audio stem paths from the video filename prefix
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

        # Load video into QMediaPlayer
        self.player.setSource(QUrl.fromLocalFile(video_path))

        # Disable controls for missing stems, enable for loaded ones
        for stem in self.stem_types:
            loaded = stem in self.audio_buffers
            for slider in self.sliders[stem].values():
                if isinstance(slider, dict):
                    continue
                slider.setEnabled(loaded)
            if not loaded:
                self.sliders[stem]["vol"].setValue(0)

        if self.audio_buffers:
            srs = {v["sr"] for v in self.audio_buffers.values()}
            if len(srs) != 1:
                print("WARNING: Not all audio files share the same samplerate. Resample them for reliable playback.")
            print(f"Video ({prefix}) and {len(self.audio_buffers)} audio tracks loaded.")
        else:
            print("Video loaded, but no audio tracks were found/loaded.")

    def load_subtitles(self):
        media_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "media")
        if not os.path.isdir(media_dir):
            media_dir = ""

        path, _ = QFileDialog.getOpenFileName(
            self, "Select Subtitle File", media_dir, "Subtitle Files (*.srt *.ass *.sub *.vtt)"
        )
        if path:
            self.subtitle_path = path
            self.subtitles = parse_srt(path)
            print(f"Subtitles loaded: {path} ({len(self.subtitles)} cues)")

    def _update_subtitles(self):
        """Update subtitle text and transport bar position."""
        pos_ms = self.player.position()
        dur_ms = self.player.duration()

        # Update transport bar
        slider = self.video_container.seek_slider
        if not slider.isSliderDown():
            slider.setValue(pos_ms)
        self.video_container.time_label.setText(
            f"{self._format_time(pos_ms)} / {self._format_time(dur_ms)}"
        )

        # Update subtitles
        if not self.subtitles:
            self.video_container.subtitle_label.hide()
            return

        current_text = ""
        for start_ms, end_ms, text in self.subtitles:
            if start_ms <= pos_ms <= end_ms:
                current_text = text
                break

        self.video_container.subtitle_label.setText(current_text)

    def _format_time(self, ms):
        """Format milliseconds as m:ss or h:mm:ss."""
        total_s = max(0, ms // 1000)
        h, remainder = divmod(total_s, 3600)
        m, s = divmod(remainder, 60)
        if h > 0:
            return f"{h}:{m:02d}:{s:02d}"
        return f"{m}:{s:02d}"

    def _on_duration_changed(self, duration_ms):
        self.video_container.seek_slider.setRange(0, duration_ms)

    def toggle_play_pause(self):
        if not self.running:
            self.start_all()
        elif self.paused:
            self.resume_playback()
        else:
            self.pause_playback()

    def pause_playback(self):
        self.paused = True
        self.player.pause()
        self.video_container.play_pause_btn.setText("Play")

    def resume_playback(self):
        self.paused = False
        self.player.play()
        self.video_container.play_pause_btn.setText("Pause")

    def seek_to(self, position_ms):
        self.player.setPosition(position_ms)
        for buf in self.audio_buffers.values():
            buf["idx"] = int(position_ms / 1000.0 * buf["sr"])

    def seek_relative(self, offset_ms):
        if not self.running:
            return
        current = self.player.position()
        duration = self.player.duration()
        new_pos = max(0, min(current + offset_ms, duration))
        self.seek_to(new_pos)

    def audio_callback(self, outdata, frames, time_info, status):
        if status:
            print(f"Stream status: {status}", file=sys.stderr)
        blocksize = frames
        nch = 6
        mixed = np.zeros((blocksize, nch), dtype=np.float32)

        if not self.running or self.paused or not self.audio_buffers:
            outdata[:] = np.zeros_like(outdata)
            return

        for name, buf in self.audio_buffers.items():
            data = buf["data"]
            idx = buf["idx"]
            if idx >= len(data):
                # Past the end — output silence for this stem
                continue
            if idx + blocksize > len(data):
                # Partial block at end — pad with silence (no looping)
                remaining = len(data) - idx
                chunk = np.zeros((blocksize, 2), dtype=np.float32)
                chunk[:remaining] = data[idx:]
                buf["idx"] = len(data)
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

            # Create audio stream first (outputs silence while running=False)
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

            # Start audio first, then video after delay to compensate for
            # BlackHole → Max audio pipeline latency
            self.player.setPosition(0)
            self.running = True
            self.paused = False
            self.video_container.play_pause_btn.setText("Pause")
            QTimer.singleShot(250, self.player.play)
            print("Playback started.")
            self.max_bridge.send_transport("play")

            self._sub_timer.start()

    def stop_all(self):
        if self.running:
            self.running = False
            self.paused = False
            self._sub_timer.stop()
            self.video_container.subtitle_label.setText("")
            self.video_container.play_pause_btn.setText("Play")
            self.video_container.seek_slider.setValue(0)
            self.video_container.time_label.setText("0:00 / 0:00")
            self.player.stop()
            if self.stream:
                try:
                    self.stream.stop()
                    self.stream.close()
                except Exception:
                    pass
                self.stream = None
            print("Playback stopped.")
            self.max_bridge.send_transport("stop")

    def closeEvent(self, event):
        self.stop_all()
        self.max_bridge.shutdown()
        super().closeEvent(event)


def main():
    app = QApplication(sys.argv)
    win = AVMixer(output_device='BlackHole 64ch')
    win.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
