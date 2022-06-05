su oled
cd /home/oled
pip3 install --upgrade --force-reinstall luma.oled
pip3 install psutil
curl -L -o stats.py https://raw.githubusercontent.com/thomas345/carcharging-public/main/stats.py
chown oled:users stats.py
