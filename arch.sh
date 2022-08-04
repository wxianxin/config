pacman -S os-prober, bluez, bluez-utils, networkmanager
# pacman -S noto-fonts-cjk

# autostart
# systemctl enable iwd
systemctl enable gdm.service
systemctl enable NetworkManager.service

# wifi
sudo systemctl start iwd & sudo iwctl station wlan0 connect Italia_5G & sudo dhcpcd wlan0
## bluetooth
sudo systemctl start bluetooth.service

# Gsettings
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
## HIDPI
gsettings set org.gnome.desktop.interface scaling-factor 2

########################################################################################
# git
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
git config --global user.email wxianxinreg@gmail.com
git config --global user.name wxianxin
################################################################################
