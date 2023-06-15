#!/bin/bash
# DO NOT sudo execute this script

cat >> ~/.bashrc << EOF
########################################################################################
# Steven
PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\$ '
alias python="python3"
alias weather="curl 'wttr.in/?m&format=%T+%l+%C+%c+%t+%h+%w+%m+%M+%p+%P+%u\nDawn:+%D\nSunrise:+%S\nZenith:+%z\nSunset:+%s\nDusk:+%d\n'"
source ~/.venv/p/bin/activate
EOF

source ~/.bashrc

cp -r ~/config/.vim ~
cp ~/config/.vimrc ~
cp ~/config/.toprc ~

################################################################################
# python setup
mkdir ~/.venv
python -m venv ~/.venv/p
source ~/.venv/p/bin/activate
python -m pip install numpy pandas black flake8    # flake8 for vim ale
########################################################################################
# rust setup

# rustup component add rls, rust-analysis, rust-src   # needed for vim etc.
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
########################################################################################
# git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
git config --global user.email wxianxinreg@gmail.com
git config --global user.name wxianxin
########################################################################################
# input method
# sudo pacman -S fcitx5 fcitx5-gtk ibus-pinyin
################################################################################
# grub
# sudo grub-reboot [X]  # reboot to windows from linux

########################################################################################
# hardware
# echo 32000 > /sys/class/backlight/intel_backlight/brightness
