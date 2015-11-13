import pibrella
import time
import random
import os

def lightshow():
    pibrella.light.red.on()
    time.sleep(0.25)
    pibrella.light.yellow.on()
    time.sleep(0.25)
    pibrella.light.green.on()
    pibrella.buzzer.success()
    time.sleep(1)
    pibrella.light.off() 

def randomgenerator():
    lightshow()
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
    if pibrella.button.read():
        randomgenerator()
