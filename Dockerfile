FROM python:3.9-slim

RUN groupadd gpio && usermod -G gpio root

# Install RPi.GPIO library and gcc for compilation of PIP packages
RUN apt-get update && apt-get install -y \
    gcc \
    rpi.gpio \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the Python script into the container at /usr/src/app
COPY app.py ./

# Install RPi.GPIO  and any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir  RPi.GPIO && \
    pip install --no-cache-dir -r requirements.txt

# Remove gcc
RUN apt-get purge \
    gcc \
    && apt-get autoremove

# Run the script when the container launches
CMD ["python", "./app.py"]
