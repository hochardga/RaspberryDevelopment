import RPi.GPIO as GPIO
import time
import random
import os

GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.IN, pull_up_down=GPIO.PUD_UP)

def randomgenerator():
    number = random.randint(1, 4)

    if number == 1:
        os.system('mpg123 singing1.mp3')
        time.sleep(1)
    elif number == 2:
        os.system('mpg123 singing2.mp3')
        time.sleep(1)
    elif number == 3:
        os.system('mpg123 singing3.mp3')
        time.sleep(1)
    elif number == 4:
        os.system('mpg123 singing4.mp3')
        time.sleep(1)
    else:
        os.system('mpg123 singing5.mp3')
        time.sleep(1)

while True:
    input_state = GPIO.input(18)
    if input_state == False:
        randomgenerator()
