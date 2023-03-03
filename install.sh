#!/bin/bash
#if [ `whoami` != 'root' ]
#  then
#    echo "You must be root to do this."
#    exit
#fi
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_ssh 0
sudo apt update
sudo apt -y dist-upgrade
sudo apt-get update
sudo apt-get install python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 -y
sudo -H pip3 install luma.oled
sudo usermod -a -G spi,gpio,i2c $USER
#apt -y autoremove 
#apt install -y git vim mc i2c-tools python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 
#apt install -y python3-dev python3-pip libjpeg-dev build-essential
#apt install -y libsdl-dev libportmidi-dev libsdl-ttf2.0-dev libsdl-mixer1.2-dev libsdl-image1.2-dev
#cd /root/
#pip3 install --upgrade --force-reinstall luma.oled
sudo pip3 install psutil
#git clone https://github.com/rm-hull/luma.examples.git
#cd luma.examples
#pip3 install -e .
#cd examples
curl -L -o sys_info.py https://raw.githubusercontent.com/thomas345/carcharging-public/main/sys_info.py
curl -L -o FreePixel.ttf https://raw.githubusercontent.com/thomas345/carcharging-public/main/FreePixel.ttf
#echo -e '#!/bin/sh\npython3 /root/sys_info.py &\nexit 0' > /etc/rc.local 
#reboot
