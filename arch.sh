pacman -S os-prober, bluez, bluez-utils, networkmanager
# pacman -S noto-fonts-cjk

# autostart
# systemctl enable iwd
systemctl enable gdm.service
systemctl enable NetworkManager.service

# wifi
sudo systemctl start iwd & sudo iwctl station wlan0 connect Italia_5G & sudo dhcpcd wlan0
# sudo nmcli dev wifi connect Italia_5G password ""
## bluetooth
sudo systemctl start bluetooth.service

