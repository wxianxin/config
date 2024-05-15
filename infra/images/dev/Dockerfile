########################################################################################
# This Dockerfile has not being tested !!!
########################################################################################
# Use an official Python runtime as the parent image
FROM docker.io/linuxserver/code-server

# metadata
LABEL maintainer="s"

# Set the working directory in the container
# WORKDIR /config/workspace

# Set up environment variables for Jupyter
# ENV JUPYTER_ENABLE_LAB=yes

# Install JupyterLab and numpy
# RUN pip install --no-cache-dir jupyterlab numpy pandas matplotlib
RUN <<EOF
apt-get update && apt-get install -y python3 python3-pip libssl-dev pkg-config && rm -rf /var/lib/apt/lists/*
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -- -y
EOF

# Make port 8888 available to the world outside this container
EXPOSE 8443

# Run JupyterLab when the container launches
CMD ["code-server"]

