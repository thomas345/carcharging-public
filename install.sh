#!/bin/bash
if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi
raspi-config nonint do_i2c 0
raspi-config nonint do_ssh 0
apt update
apt -y dist-upgrade
apt -y autoremove 
apt install -y git vim mc i2c-tools python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 
adduser --system oled
usermod -a -G i2c oled
