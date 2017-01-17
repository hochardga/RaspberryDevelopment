from gpiozero import Button
import pygame
from time import sleep

jelly_baby = Button(5)

pygame.init()
pygame.mixer.init()

burp = pygame.mixer.Sound("burp.wav")

while True:
    jelly_baby.wait_for_press()
    burp.play()
    sleep(2)
    burp.stop()
