Load latest image to SD via Raspberry Pi Imager
Touch /boot/ssh file: touch /media/tbp/boot/ssh
Login as pi with password 'raspberry'
Run script: curl -Ss https://raw.githubusercontent.com/thomas345/carcharging-public/main/install.sh | bash
Reboot
Log in as user jwp/tbp
Remove pi user: sudo userdel -r pi
