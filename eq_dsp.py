
import numpy as np
from scipy.signal import sosfilt, sosfilt_zi


def apply_pan(stereo_audio, pan):
    """Applies pan to a stereo audio signal. -1=left, +1=right."""
    left_gain = np.cos((pan + 1) * np.pi / 4)
    right_gain = np.sin((pan + 1) * np.pi / 4)
    stereo_audio[:, 0] *= left_gain
    stereo_audio[:, 1] *= right_gain
    return stereo_audio

def calc_biquad_coeffs(filter_type, gain_db, center_freq, Q, sr):
    """
    Calculates the coefficients (b0, b1, b2, a0, a1, a2) for various IIR filter types.
    Returns a numpy array of shape (1, 6).
    """
    
    A = np.power(10, gain_db / 40.0) # For PEAK, LOW_SHELF, HIGH_SHELF
    w0 = 2 * np.pi * center_freq / sr
    cos_w0 = np.cos(w0)
    sin_w0 = np.sin(w0)
    
    if filter_type == 'PEAK':
        alpha = sin_w0 / (2 * Q)
    elif filter_type in ('LOW_SHELF', 'HIGH_SHELF'):
        alpha = sin_w0 / 2.0 * np.sqrt((A + 1/A) * (1/Q - 1) + 2)
    else:
        return np.array([[1.0, 0.0, 0.0, 1.0, 0.0, 0.0]]) # Passthrough

    biquad_coeffs = np.zeros(6)
    
    # --- PEAKING EQ ---
    if filter_type == 'PEAK':
        b0 = 1 + alpha * A
        b1 = -2 * cos_w0
        b2 = 1 - alpha * A
        a0 = 1 + alpha / A
        a1 = -2 * cos_w0
        a2 = 1 - alpha / A

    # --- LOW SHELF EQ ---
    elif filter_type == 'LOW_SHELF':
        sqrt_A = np.sqrt(A)
        b0 = A * ((A + 1) - (A - 1) * cos_w0 + 2 * sqrt_A * alpha)
        b1 = 2 * A * ((A - 1) - (A + 1) * cos_w0)
        b2 = A * ((A + 1) - (A - 1) * cos_w0 - 2 * sqrt_A * alpha)
        a0 = (A + 1) + (A - 1) * cos_w0 + 2 * sqrt_A * alpha
        a1 = -2 * ((A - 1) + (A + 1) * cos_w0)
        a2 = (A + 1) + (A - 1) * cos_w0 - 2 * sqrt_A * alpha
        
    # --- HIGH SHELF EQ ---
    elif filter_type == 'HIGH_SHELF':
        sqrt_A = np.sqrt(A)
        b0 = A * ((A + 1) + (A - 1) * cos_w0 + 2 * sqrt_A * alpha)
        b1 = -2 * A * ((A - 1) + (A + 1) * cos_w0)
        b2 = A * ((A + 1) + (A - 1) * cos_w0 - 2 * sqrt_A * alpha)
        a0 = (A + 1) - (A - 1) * cos_w0 + 2 * sqrt_A * alpha
        a1 = 2 * ((A - 1) - (A + 1) * cos_w0)
        a2 = (A + 1) - (A - 1) * cos_w0 - 2 * sqrt_A * alpha

    else:
        # Fallback to passthrough if type is unknown
        return np.array([[1.0, 0.0, 0.0, 1.0, 0.0, 0.0]]) 

    biquad_coeffs[:] = [b0, b1, b2, a0, a1, a2]
    
    # Normalize by a0 and ensure it's a 2D array (required by sosfilt)
    return np.atleast_2d(biquad_coeffs / a0)


# --- EQ Class (Updated for generic multiple bands) ---

class GenericEQ:
    N_CHANNELS = 2
    RAMP_DURATION_SAMPLES = 1024 

    def __init__(self, sr, bands_setup):
        """
        Initializes the EQ with a list of band configurations.
        bands_setup: List of tuples (band_name, filter_type, center_freq_hz, Q_factor).
        """
        self.sr = sr
        self.bands_setup = bands_setup # [(name, type, freq, Q), ...]
        self.band_names = [b[0] for b in bands_setup]
        
        passthrough_sos = np.array([[1.0, 0, 0, 1.0, 0, 0]]) 
        
        self.current_sos = {name: passthrough_sos.copy() for name in self.band_names}
        self.target_sos = {name: passthrough_sos.copy() for name in self.band_names}
        self.zi = {}
        for band in self.band_names:
            self.zi[band] = self._init_zi(self.current_sos[band])
            
        self.ramp_counter = self.RAMP_DURATION_SAMPLES 
        self.ramp_step = {}


    def _init_zi(self, sos_matrix):
        """Initializes the filter states (zi) for a given SOS matrix."""
        base_zi = sosfilt_zi(sos_matrix)
        return np.tile(base_zi[:, np.newaxis, :], (1, self.N_CHANNELS, 1))


    def update_coeffs(self, gains_db_map):
        """
        Recalculates target coefficients based on new gain values and initiates a ramp.
        gains_db_map: Dictionary {band_name: gain_db}.
        """
        
        for name, filter_type, center_freq, Q in self.bands_setup:
            gain_db = gains_db_map.get(name, 0.0) # default to 0dB gain if not provided
            
            self.target_sos[name] = calc_biquad_coeffs(
                filter_type, gain_db, center_freq, Q, self.sr
            )
        
        # Start the coefficient ramp
        self.ramp_counter = 0 
        for band in self.band_names:
            delta = self.target_sos[band] - self.current_sos[band]
            self.ramp_step[band] = delta / self.RAMP_DURATION_SAMPLES


    def ramp_coeffs(self, blocksize):
        """Linearly interpolates coefficients over a block."""
        
        if self.ramp_counter < self.RAMP_DURATION_SAMPLES:
            
            steps_to_ramp = min(blocksize, self.RAMP_DURATION_SAMPLES - self.ramp_counter)
            
            for band in self.band_names:
                self.current_sos[band] += self.ramp_step[band] * steps_to_ramp
                
            self.ramp_counter += blocksize
            
            # Snap to target if ramp is complete
            if self.ramp_counter >= self.RAMP_DURATION_SAMPLES:
                 for band in self.band_names:
                     self.current_sos[band] = self.target_sos[band].copy()
                     
        
    def process(self, chunk):
        """Applies the entire EQ chain to an audio chunk."""
        
        self.ramp_coeffs(len(chunk))
        
        chunk_t = chunk.T # Shape (2, N)
        for name in self.band_names:
            chunk_t, self.zi[name] = sosfilt(self.current_sos[name], chunk_t, axis=-1, zi=self.zi[name])

        return chunk_t.T # Transpose back to (N, 2)
    



