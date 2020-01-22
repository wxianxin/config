echo "########">> ~/.bashrc
echo "# Steven">> ~/.bashrc
echo "alias python="python3"">> ~/.bashrc
echo "alias dropbox=~/.dropbox-dist/dropboxd">> ~/.bashrc
echo "alias tms='transmission-remote --auth transmission:password'">> ~/.bashrc
echo "source ~/.venv/p/bin/activate" >> ~/.bashrc

cp -r ./.vim ~
cp ./.toprc ~
cp ./.vimrc ~

source ~/.bashrc
################################################################################
# python setup
sudo apt install python3-venv
mkdir ~/.venv
python3 -m venv ~/.venv/p
source ~/.venv/p/bin/activate
python3 -m pip install numpy pandas scipy black flake8 
################################################################################
sudo apt install git
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
# sudo ubuntu-drivers autoinstall

################################################################################
# git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
################################################################################
################################################################################
################################################################################
# T420
# /etc/rc.local
# echo 10 > /sys/class/backlight/intel_backlight/brightness
# sudo mount /dev/nvme0n1p5 /home/coupe/L/
