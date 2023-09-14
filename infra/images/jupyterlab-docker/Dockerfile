# Use an official Python runtime as the parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /home/jupyter

# Set up environment variables for Jupyter
ENV JUPYTER_ENABLE_LAB=yes

# Install JupyterLab and numpy
RUN pip install --no-cache-dir jupyterlab numpy pandas matplotlib

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run JupyterLab when the container launches
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token='wangmuniangniang'"]

