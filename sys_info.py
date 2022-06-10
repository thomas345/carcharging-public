#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import time
import subprocess
from pathlib import Path
from datetime import datetime

if os.name != 'posix':
    sys.exit('{} platform not supported'.format(os.name))

#from demo_opts import get_device
from luma.core.render import canvas
from PIL import ImageFont

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
    # use custom font
    font_path = str(Path(__file__).resolve().parent.joinpath('fonts', 'FreePixel.ttf'))
    font2 = ImageFont.truetype(font_path, 12)
    font3 = ImageFont.truetype(font_path, 15)

    with canvas(device) as draw:
#        draw.text((0, 0), cpu_usage(), font=font2, fill="white")
#        if device.height >= 32:
            cmd = "hostname"
            HN = subprocess.check_output(cmd, shell = True )
            draw.text((0, 0), str(HN, 'utf-8'), font=font3, fill=255)

#        if device.height >= 64:
            draw.text((0, 32), disk_usage('/'), font=font3, fill="white")
        
#        if device.height >= 64: 
            cmd = "hostname -I |cut -d\' \' -f1"
            IP = subprocess.check_output(cmd, shell = True )    
            draw.text((0, 48), "IP:" + str(IP,'utf-8'),  font=font3, fill=255)

def main():
    while True:
        stats(device)
        time.sleep(60)


if __name__ == "__main__":
    try:
        from luma.core.interface.serial import i2c
        from luma.oled.device import sh1106
        serial = i2c(port=1, address=0x3C)
        device = sh1106(serial,rotate=2, width=128, height=64)
        main()
    except KeyboardInterrupt:
        pass
