#!/usr/bin/env python3
""" This is a test file to see if the GPIO is working """

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

print("Hello World!")
print("Seems to work!")
