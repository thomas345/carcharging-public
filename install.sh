#!/bin/bash
if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi
apt update
apt dist-upgrade
raspi-config nonint do_i2c 0
raspi-config nonint do_ssh 0
apt install -y python3-dev
apt install -y python-smbus i2c-tools
apt install -y python3-pil
apt install -y python3-pip
apt install -y python3-setuptools
apt install -y python3-rpi.gpio
apt install -y git
git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
cd Adafruit_Python_SSD1306
sudo python3 setup.py install
cd ..
curl -L -o stats.py https://raw.githubusercontent.com/thomas345/carcharging-public/main/stats.py
