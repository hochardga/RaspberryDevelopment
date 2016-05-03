import RPi.GPIO as GPIO
import time
import random
import os

GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.IN, pull_up_down=GPIO.PUD_UP)

def hmm():
    times = random.randint(0, 3)
    for _ in range(times):
        hmm_number = random.randint(1, 3)
        os.system('mpg123 hmm%d.mp3' % hmm_number)
        time.sleep(0.33)    

def randomgenerator():
    #lightshow()
    hmm()
    number = random.randint(1, 4)

    if number == 1:
        os.system('mpg123 gryffindor.mp3')
        time.sleep(1)
    elif number == 2:
        os.system('mpg123 hufflepuff.mp3')
        time.sleep(1)
    elif number == 3:
        os.system('mpg123 ravenclaw.mp3')
        time.sleep(1)
    else:
        os.system('mpg123 slytherin.mp3')
        time.sleep(1)

while True:
    input_state = GPIO.input(18)
    if input_state == False:
        randomgenerator()
