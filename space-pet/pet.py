from sense_hat import SenseHat
import time

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

while True:
    for i in range(5):
        sense.set_pixels(donkey1)
        time.sleep(0.25)
        sense.set_pixels(donkey2)
        time.sleep(0.25)
    for i in range(5):
        sense.set_pixels(cow1)
        time.sleep(0.25)
        sense.set_pixels(cow2)
        time.sleep(0.25)
