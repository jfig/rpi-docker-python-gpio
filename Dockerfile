FROM python:3.9-slim

ENV APP app.py

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

# Create script directory
RUN mkdir -p /usr/src/scripts

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/src/scripts/
RUN chmod +x /usr/src/scripts/entrypoint.sh


# Install RPi.GPIO  and any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir  RPi.GPIO && \
    pip install --no-cache-dir -r requirements.txt

# Run entrypoint.sh when the container launches
CMD ["/bin/bash", "/usr/src/scripts/entrypoint.sh"]

