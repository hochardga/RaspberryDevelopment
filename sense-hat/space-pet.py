from sense_hat import SenseHat
import time

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

def walking():
    for i in range(10):
        sense.set_pixels(pet1)
        time.sleep(0.5)
        sense.set_pixels(pet2)
        time.sleep(0.5)

x, y, z = sense.get_accelerometer_raw().values()

while x<2 and y<2 and z<2:
    x, y, z = sense.get_accelerometer_raw().values()
    
walking()
time.sleep(0.5)
sense.clear()


