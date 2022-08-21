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

# Gnome Customization
sudo hostnamectl set-hostname --static dcm

################################################################################
# python setup
mkdir ~/.venv
python3 -m venv ~/.venv/p
source ~/.venv/p/bin/activate
python3 -m pip install numpy pandas black flake8    # flake8 for vim ale
########################################################################################
# Gsettings
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
## HIDPI
gsettings set org.gnome.desktop.interface scaling-factor 2
## set wallpaper
gsettings get org.gnome.desktop.background picture-uri  # print current wallpaper path
gsettings set org.gnome.desktop.background picture-uri file:///~/config/config/colorful.jpg
## Set keyboard shortcut for terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control><Alt>t'
## gnome terminal customization
gsettings get org.gnome.Terminal.ProfilesList list
currentprofile=$(gsettings get org.gnome.Terminal.ProfilesList default)
gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ font
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ font 'Monospace 18'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ default-size-rows 32
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${currentprofile:1:-1}/ default-size-columns 100 
## gnome-terminal
cat ~/config/gterminal.profiles | dconf load /org/gnome/terminal/legacy/profiles:/
########################################################################################
# git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
git config --global user.email wxianxinreg@gmail.com
git config --global user.name wxianxin
################################################################################
# grub
# sudo grub-reboot [X]  # reboot to windows from linux


