#!/bin/bash
if [ `whoami` = 'root' ]
  then
    echo "You must NOT be root to run this script."
    exit
fi
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_ssh 0
sudo apt update
sudo apt -y dist-upgrade
sudo apt-get update
sudo apt-get install python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 -y
sudo -H pip3 install luma.oled
sudo usermod -a -G spi,gpio,i2c $USER
#pip3 install --upgrade --force-reinstall luma.oled
sudo pip3 install psutil
curl -L -o /home/$USER/sys_info.py https://raw.githubusercontent.com/thomas345/carcharging-public/main/sys_info.py
curl -L -o /home/$USER/FreePixel.ttf https://raw.githubusercontent.com/thomas345/carcharging-public/main/FreePixel.ttf
sudo su
echo -e '#!/bin/sh\npython3 /home/$USER/sys_info.py &\nexit 0' > /etc/rc.local 
exit
#reboot
echo "Please reboot for changes to take effect"
