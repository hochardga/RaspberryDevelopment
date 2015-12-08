from sense_hat import SenseHat
from evdev import InputDevice, categorize, ecodes, list_devices
import time

sense = SenseHat()

global sense_hat_device
devices = [InputDevice(fn) for fn in list_devices()]
for dev in devices:
    if dev.name == "Raspberry Pi Sense HAT Joystick":
        sense_hat_device = dev

global starting_humidity
starting_humidity = sense.get_humidity()


# PICTURES

g = (130, 248, 25) # light green
b = (62, 95, 203) # dark blue
p = (255, 28, 119) # reddish pink
w = (255, 255, 255) # white
o = (158, 97, 0) # brownish orange
e = (0, 0, 0) # empty

walking1 = [
    e, e, e, e, e, e, e, e, 
    g, e, e, e, e, e, e, e, 
    e, g, e, e, g, e, g, e, 
    e, g, b, b, g, p, p, e, 
    e, b, b, b, p, w, p, b, 
    e, b, b, b, b, p, p, e, 
    e, b, e, b, e, b, e, e, 
    e, e, e, e, e, e, e, e, 
    ]

walking2 = [
    e, e, e, e, e, e, e, e, 
    g, e, e, e, e, e, e, e, 
    e, g, e, e, g, e, g, e, 
    e, g, b, b, g, p, p, e, 
    e, b, b, b, p, w, p, b, 
    e, b, b, b, b, p, p, e, 
    e, e, b, e, b, e, e, e, 
    e, e, e, e, e, e, e, e, 
    ]

eating1 = [
    e, e, e, o, o, e, e, e,
    e, e, e, o, o, e, e, e,
    e, e, o, o, o, o, e, e,
    e, o, o, o, o, o, o, e,
    o, o, o, o, o, o, o, o,
    w, w, w, w, w, w, w, w,
    e, p, p, p, p, p, p, e,
    e, p, p, p, p, p, p, e,
    ]

eating2 = [
    e, e, e, e, e, e, e, e,
    e, e, e, o, o, e, e, e,
    e, e, o, o, o, o, e, e,
    e, o, o, o, o, o, o, e,
    o, o, o, o, o, o, o, o,
    w, w, w, w, w, w, w, w,
    e, p, p, p, p, p, p, e,
    e, p, p, p, p, p, p, e,
    ]

eating3 = [
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, o, o, o, o, e, e,
    e, o, o, o, o, o, o, e,
    o, o, o, o, o, o, o, o,
    w, w, w, w, w, w, w, w,
    e, p, p, p, p, p, p, e,
    e, p, p, p, p, p, p, e,
    ]

eating4 = [
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, o, o, o, o, o, o, e,
    o, o, o, o, o, o, o, o,
    w, w, w, w, w, w, w, w,
    e, p, p, p, p, p, p, e,
    e, p, p, p, p, p, p, e,
    ]

eating5 = [
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    o, o, o, o, o, o, o, o,
    w, w, w, w, w, w, w, w,
    e, p, p, p, p, p, p, e,
    e, p, p, p, p, p, p, e,
    ]

eating6 = [
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    w, w, w, w, w, w, w, w,
    e, p, p, p, p, p, p, e,
    e, p, p, p, p, p, p, e,
    ]

eating7 = [
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, e, e, e, e, e, e, e,
    e, p, p, p, p, p, p, e,
    e, p, p, p, p, p, p, e,
    w, w, w, w, w, w, w, w,
    e, e, e, e, e, e, e, e,
    ]

# ACTIONS

def walk():
    for i in range(5):
        sense.set_pixels(walking1)
        time.sleep(0.5)
        sense.set_pixels(walking2)
        time.sleep(0.5)

def sleep():
    sense.clear()

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

def eat():
        sense.set_pixels(eating1)
        time.sleep(0.5)
        sense.set_pixels(eating2)
        time.sleep(0.5)
        sense.set_pixels(eating3)
        time.sleep(0.5)
        sense.set_pixels(eating4)
        time.sleep(0.5)
        sense.set_pixels(eating5)
        time.sleep(0.5)
        sense.set_pixels(eating6)
        time.sleep(0.5)
        sense.set_pixels(eating7)
        time.sleep(0.5)


# DETECTING

def is_moving():
    x, y, z = sense.get_accelerometer_raw().values()
    if x<2 and y<2 and z<2:
        return False
    else:
        return True

def if_joystick():
    for event in sense_hat_device.read_loop():
        if event.type == ecodes.EV_KEY:
            return True
        else:
             break
    return False

def is_feeding():
    humidity = sense.get_humidity()
    print("humidity %d" % humidity)
    print("starting_humidity %d" % starting_humidity)
    print("difference %d" % (humidity - starting_humidity))
    if (humidity - starting_humidity) > 3:
        print("Feeding time")

# START



while True:
    #if if_joystick():
    #    eat()
    
    if is_moving():
        walk()
    else:
        rotate()

