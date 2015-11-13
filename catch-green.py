import pibrella
import time
import random
import os

def toggle_light(color):
    if color == 'green':
        pibrella.buzzer.note(200)
    pibrella.light[color].on()
    time.sleep(0.1) #speed
    if pibrella.button.read():
        game_over(color)
        return False #start a new game
    pibrella.buzzer.stop()
    pibrella.light[color].off()
    return True #continue the game

def button_pressed(pin):
    game_over()
    
def game_over(color):
    if color == 'green':
        pibrella.buzzer.success()
    else:
        pibrella.buzzer.fail()

    time.sleep(2)
    pibrella.light.off()

def start_game():
    while True:
        for color in ['red', 'yellow', 'green']:
            if toggle_light(color) == False:
                break
while True:
    start_game()
    time.sleep(2)
