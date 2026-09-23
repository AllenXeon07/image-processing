# Image Processing

Dockerized Jupyter Lab workspace for image-processing experiments.

Author: Francisco Allenxeon - 6025252006@student.its.ac.id

## Overview

This repository provides a reproducible notebook environment for image enhancement work. It includes:

- A CUDA-based Docker image for GPU-enabled experimentation
- Jupyter Lab exposed locally on port `8888`
- Pinned Python dependencies for OpenCV, NumPy, SciPy, Matplotlib, and notebook tooling
- Spatial-domain and frequency-domain image enhancement notebooks

## Requirements

- Docker
- Docker Compose
- NVIDIA GPU drivers and NVIDIA Container Toolkit, if you want GPU acceleration

The container can still be useful for notebook work without GPU-specific workloads, but the Compose file is configured to request NVIDIA GPU devices.

## Quick Start

Build and start Jupyter Lab:

```bash
docker compose up --build
```

Open Jupyter Lab in your browser:

```text
http://127.0.0.1:8888
```

No token or password is configured because the service is bound to localhost.

Stop the environment:

```bash
docker compose down
```

## Project Structure

```text
.
|-- Dockerfile          # CUDA-based Python/Jupyter image
|-- compose.yml         # Local Jupyter Lab service configuration
|-- notebook1.ipynb     # Image enhancement notebook
|-- notebook2.ipynb     # Frequency-domain image enhancement notebook
|-- requirements.txt    # Python dependencies
`-- README.md
```

## Notebook Submission

| No. | Task                               | Notebook Link                           | Description                                                                                                           | Main Tools                |
| --- | ---------------------------------- | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| 1   | Image Enhancement                  | [Open notebook1.ipynb](notebook1.ipynb) | Spatial-domain enhancement experiments with image loading, visualization, and filtering workflows.                    | OpenCV, NumPy, Matplotlib |
| 2   | Frequency-Domain Image Enhancement | [Open notebook2.ipynb](notebook2.ipynb) | FFT magnitude visualization, LPF/HPF filtering, homomorphic filtering, notch reject filtering, and HFE experiments.   | OpenCV, NumPy, Matplotlib |


## Frequency-Domain Notebook

`notebook2.ipynb` focuses on image enhancement in the frequency domain. The notebook is organized as:

- Fourier Transform: displays the original image and centered FFT magnitude spectrum.
- Low Pass Filter: compares Ideal, Butterworth, and Gaussian LPF with multiple cutoff parameters.
- High Pass Filter: compares Ideal, Butterworth, and Gaussian HPF with multiple cutoff parameters.
- Homomorphic Filter: applies log transform, frequency-domain emphasis, inverse transform, and exponential reconstruction.
- Butterworth Notch Reject Filter: demonstrates direct and synthetic periodic-noise notch rejection.
- Experiment: compares Original, Butterworth HPF, high-frequency emphasis filtering, and histogram equalization on the emphasized result.

The current experiment follows the textbook-style flow:

```text
Original -> Butterworth HPF -> High-Frequency Emphasis -> Histogram Equalization
```

Current experiment parameters:

```python
experiment_params = {
    "cutoff_ratio": 0.04,
    "order": 2,
    "low_gain": 0.5,
    "high_gain": 1.5
}
```

## Notes

- The repository is mounted into the container at `/workspace`, so notebook changes are saved directly to your local files.
- Runtime caches are stored under `./cache` and ignored by git.
- Jupyter Lab is configured without authentication for convenience. Keep the port bound to `127.0.0.1` unless you add proper access controls.
