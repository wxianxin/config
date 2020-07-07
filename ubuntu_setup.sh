#!/bin/bash
# DO NOT sudo execute this script

echo "########">> ~/.bashrc
echo "# Steven">> ~/.bashrc
echo "alias python="python3"">> ~/.bashrc
echo "alias dropbox=~/.dropbox-dist/dropboxd">> ~/.bashrc
echo "alias tms='transmission-remote --auth transmission:password'">> ~/.bashrc
echo "source ~/.venv/p/bin/activate" >> ~/.bashrc
source ~/.bashrc

cp -r ~/config/.vim ~
cp ~/config/.toprc ~
cp ~/config/.vimrc ~
################################################################################
# python setup
sudo apt install python3-venv
# mkdir ~/.venv
# python3 -m venv ~/.venv/p
# source ~/.venv/p/bin/activate
# python3 -m pip install numpy pandas scipy black flake8 
################################################################################
sudo apt install git
sudo apt install vim
sudo apt install gnome-tweak-tool
# sudo apt install nfs-kernel-server # then specify which path to share in /etc/exports; END
# sudo apt install mplayer
# sudo apt install openssh-server
# sudo apt install transmission-daemon
# sudo apt install ibus-pinyin
# sudo apt install fcitx-googlepinyin

sudo apt update
sudo apt install -f
sudo apt autoremove
sudo apt autoclean

# sudo reboot
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
########################################################################################
# nvidia
ubuntu-drivers devices
# sudo ubuntu-drivers autoinstall
########################################################################################
rm -r ~/Documents
rm -r ~/Music
rm -r ~/Pictures
rm -r ~/Public
rm -r ~/Templates
rm -r ~/Videos
########################################################################################
# git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
git config --global user.email wxianxinreg@gmail.com
git config --global user.name wxianxin
################################################################################
################################################################################
################################################################################
# T420
# /etc/rc.local
# echo 10 > /sys/class/backlight/intel_backlight/brightness

