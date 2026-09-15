# Enhancing Audience Experience Through Audio Parameter Adjustments for Deaf and Hard-of-Hearing Individuals

Our research investigates whether independent control of audio stems in multimedia settings can provide DHH individuals with a more satisfying listening experience than current approaches. This research prototype provides an interface for these personalizations.

## Requirements

- Python 3.11+

## Setup

Clone the repo and create a virtual environment:

```bash
python3 -m venv env
```

Activate it:

```bash
# macOS / Linux
source env/bin/activate

# Windows (PowerShell)
env\Scripts\Activate.ps1
```

Install dependencies:

```bash
pip install -r requirements.txt
```

## Usage

Simply run: 

```bash
python main.py
```

After running the Python script and opening the Max patch, you should be able to adjust the audio parameters for a video clip once you load it in using the interface. 

## Notes

You'll need to install a few things in order to use the interface as intended. 

- [BlackHole 64ch](https://existential.audio/blackhole/) (needed to route audio from the Python script to the Max Patch)
- [kHs Pitch Shifter](https://kilohearts.com/products/pitch_shifter) (used by the Max patch for low latency pitch shifting)
- Media files (found in the Google Drive)
