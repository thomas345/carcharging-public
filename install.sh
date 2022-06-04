#!/bin/bash
if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi
apt update
apt -y dist-upgrade
raspi-config nonint do_i2c 0
raspi-config nonint do_ssh 0
apt install -y git vim mc i2c-tools python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 
pip3 install luma.oled
pip3 install psutil
adduser --system oled5
usermod -a -G i2c oled5
cd /home/oled
curl -L -o stats.py https://raw.githubusercontent.com/thomas345/carcharging-public/main/stats.py
