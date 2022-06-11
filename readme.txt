Load latest image to SD via Raspberry Pi Imager
Touch /boot/ssh file: touch /media/tbp/boot/ssh
Login as pi with password 'raspberry'
Creat user with adduser
Run script: curl -Ss https://raw.githubusercontent.com/thomas345/carcharging-public/main/install.sh | bash
Log in as user done in step 4
Remove pi user: sudo userdel -r pi
