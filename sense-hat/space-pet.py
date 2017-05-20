from sense_hat import SenseHat
import time
import os

sense = SenseHat()

g = (130, 248, 25) # light green
b = (62, 95, 203) # dark blue
p = (255, 28, 119) # reddish pink
w = (255, 255, 255) # white
e = (0, 0, 0) # empty

pet1 = [
    e, e, e, e, e, e, e, e, 
    g, e, e, e, e, e, e, e, 
    e, g, e, e, g, e, g, e, 
    e, g, b, b, g, p, p, e, 
    e, b, b, b, p, w, p, b, 
    e, b, b, b, b, p, p, e, 
    e, b, e, b, e, b, e, e, 
    e, e, e, e, e, e, e, e, 
    ]

pet2 = [
    e, e, e, e, e, e, e, e, 
    g, e, e, e, e, e, e, e, 
    e, g, e, e, g, e, g, e, 
    e, g, b, b, g, p, p, e, 
    e, b, b, b, p, w, p, b, 
    e, b, b, b, b, p, p, e, 
    e, e, b, e, b, e, e, e, 
    e, e, e, e, e, e, e, e, 
    ]

def sleep():
    sense.clear()

def walk():
    os.system('flite -t "Hello everyone!" &')
    for i in range(10):
        sense.set_pixels(pet1)
        time.sleep(0.5)
        sense.set_pixels(pet2)
        time.sleep(0.5)
    sleep()
     
while True:
    x, y, z = sense.get_accelerometer_raw().values()
    if x>1 or y>1 or z>1:
        walk()
        


