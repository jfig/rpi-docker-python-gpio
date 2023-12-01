# rpi-docker-python-gpio

Docker Image for Running Python Applications on Raspberry Pi: Specifically 
designed to handle GPIO pin manipulation, this image provides an efficient 
environment for deploying and testing Python-based applications that interact 
ith the Raspberry Pi's hardware. Ideal for developers looking to containerize 
their GPIO-driven projects.

## Usage

```bash
docker run --device /dev/gpiomem  --group-add gpio  jfig/rpi-docker-python-gpio
```

On first execution ```/usr/src/scripts/entrypoint.sh``` is run to install python packages on packages.txt.

## Environment Variables

### APP

Name of the python application that is run by default on container startup.

Default: ```app.py```
