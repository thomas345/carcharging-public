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
echo 'jwp ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/020_jwp-nopasswd
echo 'tbp ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/030_tbp-nopasswd
useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'xyz') tbp
useradd -m -p $(perl -e 'print crypt($ARGV[0], "password")' 'xyz') jwp
apt install -y git vim mc i2c-tools python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 
apt install -y python3-dev python3-pip libfreetype6-dev libjpeg-dev build-essential
apt install -y libsdl-dev libportmidi-dev libsdl-ttf2.0-dev libsdl-mixer1.2-dev libsdl-image1.2-dev
cd /root/
pip3 install --upgrade --force-reinstall luma.oled
pip3 install psutil
git clone https://github.com/rm-hull/luma.examples.git
cd luma.examples
pip3 install -e .
cd examples
curl -L -o sys_info.py https://raw.githubusercontent.com/thomas345/carcharging-public/main/sys_info.pycat "
