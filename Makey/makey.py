import RPi.GPIO as GPIO
import time
import random
import os

os.system('flite -t "Makey ready "')

def randomgenerator():
    number = random.randint(1, 4)

    if number == 1:
        os.system('mpg123 Makey1.mp3')
        time.sleep(1)
    elif number == 2:
        os.system('mpg123 Makey2.mp3')
        time.sleep(1)
    elif number == 3:
        os.system('mpg123 Makey3.mp3')
        time.sleep(1)
    

GPIO.setmode(GPIO.BCM)
GPIO.setup(12, GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
    if GPIO.input(12) == False:
        randomgenerator()
