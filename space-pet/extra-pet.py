from sense_hat import SenseHat
import time
import os

sense = SenseHat()

w = [255,255,255]
B = [131,76,27] # brown
o = [255,127,0]
G = [141,141,141] # grey
b = [48,48,48] # black
e = [0,0,0]

donkey1 = [
    e,e,e,e,e,e,e,e,
    e,e,e,e,e,e,e,e,
    e,e,e,e,e,e,e,e,
    o,e,e,e,e,w,w,w,
    e,o,G,G,G,w,e,w,
    e,e,G,G,G,G,w,e,
    e,e,e,b,e,b,e,e,
    e,e,e,e,e,e,e,e,
]

donkey2 = [
    e,e,e,e,e,e,e,e,
    e,e,e,e,e,e,e,e,
    e,e,e,e,e,e,e,e,
    e,e,e,e,e,w,w,w,
    e,o,G,G,G,w,e,w,
    o,e,G,G,G,G,w,e,
    e,e,b,e,b,e,e,e,
    e,e,e,e,e,e,e,e,
]

cow1 = [
    e,e,e,e,e,e,e,e,
    e,e,e,e,e,e,e,e,
    e,e,w,b,w,B,B,B,
    e,w,b,w,b,B,e,B,
    w,b,w,b,w,b,B,e,
    e,w,b,w,b,w,e,e,
    e,e,b,e,e,b,e,e,
    e,e,e,e,e,e,e,e
    ]

cow2 = [
    e,e,e,e,e,e,e,e,
    e,e,e,e,e,e,e,e,
    e,e,w,b,w,B,B,B,
    e,w,b,w,b,B,e,B,
    e,b,w,b,w,b,B,e,
    w,w,b,w,b,w,e,e,
    e,e,e,b,e,e,b,e,
    e,e,e,e,e,e,e,e
    ]

def rotate():
    x, y, z = sense.get_accelerometer_raw().values()
    x = round(x, 0)
    y = round(y, 0)

    if x == -1:
        sense.set_rotation(180)
    elif y == -1:
        sense.set_rotation(90)
    elif y == 1:
        sense.set_rotation(270)
    else:
        sense.set_rotation(0)

def walk():
    x, y, z = sense.get_accelerometer_raw().values()
    if x > 1.5 or y > 1.5 or z > 1.5:
        os.system('mpg123 donkey.mp3 &')
        for i in range(5):
            rotate()
            sense.set_pixels(donkey1)
            time.sleep(0.25)
            sense.set_pixels(donkey2)
            time.sleep(0.25)
        os.system('mpg123 cow.mp3 &')
        for i in range(5):
            rotate()
            sense.set_pixels(cow1)
            time.sleep(0.25)
            sense.set_pixels(cow2)
            time.sleep(0.25)
        sense.clear()
    elif z > -1.5 and z < -0.5 and x < 1.5 and y < 1.5:
        time.sleep(0.5)
        if z > -1.5 and z < -0.5 and x < 1.5 and y < 1.5:
            os.system('mpg123 sleep.mp3')

sense.clear()
while True:
    walk()
