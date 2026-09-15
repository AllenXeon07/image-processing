# Image Processing

Dockerized Jupyter Lab workspace for image-processing experiments.

Author: Francisco Allenxeon - 6025252006@student.its.ac.id

## Overview

This repository provides a reproducible notebook environment for image enhancement work. It includes:

- A CUDA-based Docker image for GPU-enabled experimentation
- Jupyter Lab exposed locally on port `8888`
- Pinned Python dependencies for OpenCV, NumPy, SciPy, Matplotlib, and notebook tooling

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
|-- requirements.txt    # Python dependencies
`-- README.md
```

## Notebook Submission

| No. | Task              | Notebook Link                          | Description                                                                               | Main Tools                |
| --- | ----------------- | -------------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------- |
| 1   | Image Enhancement | [Open notebook1.ipynb](notebook1.ipynb) | Image enhancement experiments with image loading, visualization, and filtering workflows. | OpenCV, NumPy, Matplotlib |

## Notes

- The repository is mounted into the container at `/workspace`, so notebook changes are saved directly to your local files.
- Runtime caches are stored under `./cache` and ignored by git.
- Jupyter Lab is configured without authentication for convenience. Keep the port bound to `127.0.0.1` unless you add proper access controls.
