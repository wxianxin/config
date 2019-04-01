echo "########">> ~/.bashrc
echo "# Steven">> ~/.bashrc
echo "alias python="python3"">> ~/.bashrc
echo "alias dropbox=~/.dropbox-dist/dropboxd">> ~/.bashrc
echo "alias tms='transmission-remote --auth transmission:password'">> ~/.bashrc
echo "source ~/.venvs/p/bin/activate" >> ~/.bashrc

################################################################################
# # python setup
# sudo apt install python3-venv
# mkdir ~/.venvs
# python -m venv ~/.venvs/p
# source ~/.venvs/p/bin/activate
# python -m pip install numpy
# python -m pip install pandas
# python -m pip install scipy
################################################################################

sudo apt install vim
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
sudo ubuntu-drivers autoinstall


################################################################################
# T420
# /etc/rc.local
# echo 10 > /sys/class/backlight/intel_backlight/brightness
# sudo mount /dev/nvme0n1p5 /home/coupe/L/