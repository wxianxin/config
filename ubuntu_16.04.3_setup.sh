echo "########">> ~/.bashrc
echo "# Steven">> ~/.bashrc
echo "alias python="python3"">> ~/.bashrc


sudo apt purge gnome-sudoku
sudo apt purge gnome-mines 
sudo apt purge aisleriot
sudo apt purge gnome-mahjongg 
sudo apt purge firefox* 
sudo apt purge gnome-orca
sudo apt purge totem*
sudo apt purge imagemagick*
sudo apt purge rhythmbox*
sudo apt purge librhythmbox-core9:amd64
sudo apt purge transmission*
sudo apt purge empathy*

sudo apt autoremove
sudo apt update
sudo apt install vim
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i --force-all google-chrome-stable_current_amd64.deb
#sudo apt install openssh-server
#sudo apt install transmission-daemon
# sudo apt-get install mplayer
# sudo apt-get install fcitx-googlepinyin

sudo apt update
sudo apt install -f
sudo apt autoremove
sudo apt autoclean
sudo reboot

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# /etc/rc.local
echo 10 > /sys/class/backlight/intel_backlight/brightness