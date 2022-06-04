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
#apt install -y python3-dev python3-pil python3-pip python-smbus i2c-tools python3-setuptools python3-rpi.gpio
apt install -y git vim mc
cd /root/
git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
cd Adafruit_Python_SSD1306
python3 setup.py install
cd ..
curl -L -o stats.py https://raw.githubusercontent.com/thomas345/carcharging-public/main/stats.py
