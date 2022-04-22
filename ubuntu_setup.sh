#!/bin/bash
# DO NOT sudo execute this script

echo "################" >> ~/.bashrc
echo "# Steven" >> ~/.bashrc
echo "alias python="python3"" >> ~/.bashrc
echo "alias weather='curl v2.wttr.in/newyork'" >> ~/.bashrc
echo "alias dropbox=~/.dropbox-dist/dropboxd" >> ~/.bashrc
echo "alias tms='transmission-remote --auth transmission:password'" >> ~/.bashrc
echo "source ~/.venv/p/bin/activate" >> ~/.bashrc
source ~/.bashrc

cp -r ~/config/.vim ~
cp ~/config/.vimrc ~
cp ~/config/.toprc ~
################################################################################
# python setup
sudo apt install python3-venv
mkdir ~/.venv
python3 -m venv ~/.venv/p
source ~/.venv/p/bin/activate
python3 -m pip install numpy pandas scipy black
sudo apt install flake8 # for vim ale
########################################################################################
# gnome terminal customization
gsettings get org.gnome.Terminal.ProfilesList list
currentprofile=$(gsettings get org.gnome.Terminal.ProfilesList default)
gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ font
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ font 'Monospace 18'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ default-size-rows 32
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ default-size-columns 100 
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
# gnome-terminal
cat ~/config/gterminal.profiles | dconf load /org/gnome/terminal/legacy/profiles:/
########################################################################################
# git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
git config --global user.email wxianxinreg@gmail.com
git config --global user.name wxianxin
################################################################################
################################################################################
# reboot to windows from ubuntu
# sudo grub-reboot [X]
################################################################################
# T420
# /etc/rc.local
# echo 10 > /sys/class/backlight/intel_backlight/brightness


