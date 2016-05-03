import pibrella
import time
import random
import os

def randomgenerator():
    number = random.randint(1, 5)

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
    if pibrella.button.read():
        randomgenerator()
