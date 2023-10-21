#!/bin/bash
# DO NOT sudo execute this script

########################################################################################
sudo apt install git
sudo apt install vim
sudo apt install gnome-tweaks
# sudo apt install nfs-kernel-server # then specify which path to share in /etc/exports; END
# sudo apt install openssh-server
# sudo apt install transmission-daemon
# sudo apt install mpv
# sudo apt install libvdpau-va-gl1
# sudo apt install ubuntu-restricted-extras
sudo apt install ibus-libpinyin 
# then go to settings->keyboard->Input Sources-> + -> dot dot dot -> other -> chinese

sudo apt update
sudo apt install -f
sudo apt autoremove
sudo apt autoclean

# sudo reboot
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
########################################################################################
rm -r ~/Documents
rm -r ~/Music
rm -r ~/Pictures
rm -r ~/Public
rm -r ~/Templates
rm -r ~/Videos
################################################################################
# T420
# /etc/rc.local
# echo 10 > /sys/class/backlight/intel_backlight/brightness


