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
########################################################################################
# python setup
sudo dnf install python3-venv
mkdir ~/.venv
python3 -m venv ~/.venv/p
source ~/.venv/p/bin/activate
python3 -m pip install numpy pandas scipy black
sudo dnf install flake8 # for vim ale
########################################################################################
sudo dnf install vim
# sudo dnf install mplayer
# sudo dnf install openssh-server
# sudo dnf install transmission-daemon

sudo dnf autoremove
########################################################################################
# Gnome Customization
sudo hostnamectl set-hostname --static dcm

# Set keyboard shortcut for terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control><Alt>t'
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

# sudo reboot

# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# sudo mount /dev/nvme0n1p5 /home/coupe/L/

########################################################################################
# Dell G5 SE 
# sudo grubby --update-kernel=ALL --args="amdgpu.runpm=0"
########################################################################################
