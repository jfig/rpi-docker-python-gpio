FROM python:3.9-slim

ENV APP app.py

RUN groupadd gpio && usermod -G gpio root

# Install RPi.GPIO library and gcc for compilation of PIP packages
RUN apt-get update && apt-get install -y \
    gcc \
    rpi.gpio \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app/
# Create script directory, copy the entrypoint script into the container, and make it executable
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh


# Set the working directory in the container
WORKDIR /app

# Install RPi.GPIO  and any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir  RPi.GPIO && \
    pip install --no-cache-dir -r requirements.txt

# Copy the Python script into the container at /usr/src/app
COPY app.py ./

CMD ["/bin/bash", "/usr/src/app/entrypoint.sh"]