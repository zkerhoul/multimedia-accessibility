import sys, time
import sounddevice as sd
import soundfile as sf
import numpy as np

from PyQt6.QtWidgets import (
    QDialog, QWidget, QVBoxLayout, QHBoxLayout,
    QPushButton, QLabel, QSlider, QGridLayout
)
from PyQt6.QtCore import Qt, QTimer

from eq_dsp import GenericEQ, apply_pan 

class NineBandEQDialog(QDialog):
    FREQUENCIES_HZ = [31.5, 63, 125, 250, 500, 1000, 2000, 4000, 8000] 
    Q_FACTOR = 1.414 
    MAX_GAIN_DB = 12

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("9-Band EQ Pre-Video")
        self.setModal(True)

        self.audio_file = "sample.wav"
        self.audio_buffer = None
        self.sr = None
        self.eq = None
        
        self.running = False
        self.stream = None

        self.sliders = {}
        self.gains = {f"{freq}Hz": 0 for freq in self.FREQUENCIES_HZ}
        self.final_gains = None # To store the result upon acceptance

        self.load_audio_clip()
        self.init_ui()
        
        # Start the playback automatically if audio loaded
        if self.audio_buffer is not None:
            self.start_playback()

    def load_audio_clip(self):
        """Loads a short audio clip for the user to audition the EQ settings."""
        try:
            data, sr = sf.read(self.audio_file, always_2d=True)
            if data.shape[1] == 1:
                data = np.repeat(data, 2, axis=1)
            self.audio_buffer = {"data": data.astype(np.float32), "sr": sr, "idx": 0} 
            self.sr = sr
            
            # Setup the bands for GenericEQ: (name, type, center_freq, Q)
            bands_setup = []
            for freq in self.FREQUENCIES_HZ:
                name = f"{freq}Hz"
                bands_setup.append((name, 'PEAK', freq, self.Q_FACTOR))
                
            self.eq = GenericEQ(sr, bands_setup)
            # Initialize EQ to current slider values (all 0dB by default)
            self.eq.update_coeffs(self.gains) 
            for band in self.eq.target_sos:
                self.eq.current_sos[band] = self.eq.target_sos[band].copy()
            self.eq.ramp_counter = self.eq.RAMP_DURATION_SAMPLES

            print(f"9-Band EQ audio clip loaded: {self.audio_file}")

        except sf.SoundFileError:
            print(f"Error: Audio file not found or corrupted: {self.audio_file}")
            self.audio_buffer = None


    def init_ui(self):
        """Sets up the GUI for the 9-band EQ."""
        
        main_layout = QVBoxLayout()
        
        # Instructions Label
        main_layout.addWidget(QLabel("<h2>Adjust 9-Band Pre-EQ for Audition Clip</h2>"))
        main_layout.addWidget(QLabel(f"Auditioning: {self.audio_file}"))

        # 9-Band EQ Sliders
        grid_layout = QGridLayout()
        
        for i, freq in enumerate(self.FREQUENCIES_HZ):
            name = f"{freq}Hz"
            col = i % 9

            # Label (Frequency)
            freq_label = QLabel(name)
            freq_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
            grid_layout.addWidget(freq_label, 0, col)

            # Slider
            slider = QSlider(Qt.Orientation.Vertical)
            slider.setRange(-self.MAX_GAIN_DB, self.MAX_GAIN_DB)
            slider.setValue(0)
            slider.setTickInterval(1)
            slider.setSingleStep(1)
            slider.valueChanged.connect(lambda v, n=name: self.update_gain(n, v))
            slider.setMinimumHeight(200)
            grid_layout.addWidget(slider, 1, col)
            self.sliders[name] = slider

            # Gain Label
            gain_label = QLabel("+0dB")
            gain_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
            grid_layout.addWidget(gain_label, 2, col)
            slider.valueChanged.connect(lambda v, l=gain_label: l.setText(f"{v:+d}dB"))

        main_layout.addLayout(grid_layout)

        # Control Buttons
        h_controls = QHBoxLayout()
        
        reset_button = QPushButton("Reset All")
        reset_button.clicked.connect(self.reset_all_gains)
        h_controls.addWidget(reset_button)

        ok_button = QPushButton("Accept and Proceed")
        ok_button.clicked.connect(self.accept_gains)
        h_controls.addWidget(ok_button)
        
        cancel_button = QPushButton("Cancel (Use Flat EQ)")
        cancel_button.clicked.connect(self.reject)
        h_controls.addWidget(cancel_button)
        
        main_layout.addLayout(h_controls)
        self.setLayout(main_layout)

    def update_gain(self, name, gain_db):
        """Called when a slider value changes."""
        self.gains[name] = gain_db
        if self.eq:
            self.eq.update_coeffs(self.gains)

    def reset_all_gains(self):
        """Resets all sliders to 0dB."""
        for name, slider in self.sliders.items():
            slider.setValue(0)
        # update_gain is called by setValue(0)

    def accept_gains(self):
        """Saves the current gains and closes the dialog."""
        self.final_gains = self.gains.copy()
        self.accept()
        
    def start_playback(self):
        """Starts the sounddevice stream for the audio clip."""
        if not self.audio_buffer or self.running:
            return
            
        self.running = True
        blocksize = 1024 
        
        self.stream = sd.OutputStream(
            samplerate=self.sr, 
            blocksize=blocksize,
            channels=2, 
            callback=self.audio_callback,
            dtype='float32'
        )
        self.stream.start()
        print("9-Band EQ audition playback started.")

    def stop_playback(self):
        """Stops and cleans up the sounddevice stream."""
        self.running = False
        if self.stream:
            self.stream.stop()
            self.stream.close()
            self.stream = None
        print("9-Band EQ audition playback stopped.")


    def audio_callback(self, outdata, frames, time_info, status):
        """Sounddevice callback function."""
        if status:
            print(f"Stream status: {status}", file=sys.stderr)
            
        blocksize = frames
        buf = self.audio_buffer
        data = buf["data"]
        idx = buf["idx"]
        
        if not self.running:
            outdata[:] = 0
            return

        # Handle looping
        if idx + blocksize > len(data):
            wrap_len = len(data) - idx
            chunk = np.zeros((blocksize, 2), dtype=np.float32)
            chunk[:wrap_len] = data[idx:]
            chunk[wrap_len:] = data[:blocksize - wrap_len]
            buf["idx"] = blocksize - wrap_len
        else:
            chunk = data[idx:idx+blocksize].copy()
            buf["idx"] = idx + blocksize

        # Apply 9-Band EQ and 0dB gain (no volume/pan control here)
        if self.eq:
            chunk = self.eq.process(chunk)

        # Simple soft clipping to prevent overload in the audition
        mixed = np.clip(chunk, -1.0, 1.0)
        outdata[:] = mixed

    def closeEvent(self, event):
        """Ensure cleanup when the dialog is closed."""
        self.stop_playback()
        super().closeEvent(event)

    def reject(self):
        """Custom reject to stop playback before closing."""
        self.stop_playback()
        super().reject()

    def accept(self):
        """Custom accept to stop playback before closing."""
        self.stop_playback()
        super().accept()
        

# Note: The main application will handle instantiating and running this dialog.
# The `get_final_gains` method is used to retrieve the settings after closing.
def get_final_gains(parent=None):
    """Convenience function to run the dialog and return the results."""
    dialog = NineBandEQDialog(parent)
    result = dialog.exec()
    if result == QDialog.DialogCode.Accepted:
        return dialog.final_gains
    else:
        return None # Cancelled or rejected