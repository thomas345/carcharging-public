from luma.core.interface.serial import i2c
from luma.core.render import canvas
from luma.oled.device import sh1106
from time import sleep

serial = i2c(port=1, address=0x3C)
device = sh1106(serial, rotate=2)

import os
import sys
import time
import RPi.GPIO as GPIO 
import subprocess
from pathlib import Path
from datetime import datetime

if os.name != 'posix':
    sys.exit(f'{os.name} platform is not supported')

from PIL import ImageFont

GPIO.setmode(GPIO.BCM)  
GPIO.setup(17, GPIO.IN, pull_up_down = GPIO.PUD_UP)

def Shutdown(channel):  
    time.sleep(2)
    if GPIO.input(17) == GPIO.LOW:
      #print('Please wait while the program is loading...') 
      device.clear()
      os.system("sudo shutdown -h now")
      #device.clear()
      #sys.exit()

GPIO.add_event_detect(17, GPIO.FALLING, callback = Shutdown, bouncetime = 2000)



try:
    import psutil
except ImportError:
    print("The psutil library was not found. Run 'sudo -H pip install psutil' to install it.")
    sys.exit()

def disk_usage(dir):
    usage = psutil.disk_usage(dir)
    return "DISK: %.0f%%" \
        %  usage.percent 


def stats(device):
    font_path = 'FreePixel.ttf'
    font2 = ImageFont.truetype(font_path, 12)
    font3 = ImageFont.truetype(font_path, 15)

    with canvas(device) as draw:
            cmd = "hostname"
            HN = subprocess.check_output(cmd, shell = True )
            draw.text((0, 0), str(HN, 'utf-8'),font=font3,  fill=255)

            draw.text((0, 32), disk_usage('/'), font=font3, fill="white")
        
            cmd = "hostname -I |cut -d\' \' -f1"
            IP = subprocess.check_output(cmd, shell = True )    
            draw.text((0, 48), "IP:" + str(IP,'utf-8'), font=font3, fill=255)


def main():
    while True:
        stats(device)
        time.sleep(5)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
