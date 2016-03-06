import pibrella
import time
import random
import os

def randomgenerator():
    number = random.randint(1, 4)

    if number == 1:
        os.system('mpg123 yoda-bum.mp3')
        time.sleep(1)
    elif number == 2:
        os.system('mpg123 yoda-chicken.mp3')
        time.sleep(1)
    elif number == 3:
        os.system('mpg123 yoda-feisty.mp3')
        time.sleep(1)
    elif number == 3:
        os.system('mpg123 yoda-hmmm.mp3')
        time.sleep(1)
    elif number == 3:
        os.system('mpg123 yoda-miss.mp3')
        time.sleep(1)
    else:
        os.system('mpg123 yoda-strong.mp3')
        time.sleep(1)

while True:
    if pibrella.button.read():
        randomgenerator()
