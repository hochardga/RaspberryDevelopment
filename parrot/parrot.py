import RPi.GPIO as GPIO
import subprocess
import time
import random
import os

#print('one')
#os.system('arecord -D plughw:1 --duration=3 -f cd -vv ~/rectest.wav')
#print('two')
#os.system('aplay rectest-01.wav')
#print('three')
#os.system('rm rectest-*')
#print('four')


print('one')
proc = subprocess.Popen('arecord -D plughw:1 --duration=3 -f cd -vv ~/rectest.wav', shell=True)
print('two')
time.sleep(5)
print('three')
proc.terminate()
print('four')
