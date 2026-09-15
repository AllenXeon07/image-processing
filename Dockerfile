FROM nvidia/cuda:13.3.0-runtime-ubuntu26.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
# Allow pip to modify system-level Python packages inside Docker
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# Keep runtime caches outside /workspace so bind mounts do not create repo-local mountpoints.
ENV XDG_CACHE_HOME=/cache \
    TORCH_HOME=/cache/torch \
    PIP_CACHE_DIR=/cache/pip \
    CC=/usr/bin/gcc \
    CXX=/usr/bin/g++

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    python3 \
    python3-pip \
    python3-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.token=", "--ServerApp.password=", "--ServerApp.disable_check_xsrf=True"]
