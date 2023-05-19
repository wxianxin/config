# arch install

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

echo archname > /etc/hostname
pacman -S grub efibootmgr # os-prober
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

genfstab -U /mnt >> /mnt/etc/fstab
# add user other than root
useradd -m -s /bin/bash my_user

################################
# pacman -S base-devel
################################

pacman -S sudo
# enable sudo for the user
usermod -aG wheel my_user

########################################################################################
# gnome
pacman -S gdm gnome-console gnome-disk-utility gnome-system-monitor gnome-text-editor nautilus gvfs-smb gnome-control-center
# gvfs-smb: smb for nautilus
systemctl enable gdm.service
########################################################################################
pacman -S networkmanager
systemctl enable NetworkManager.service

pacman -S bluez bluez-utils
systemctl enable bluetooth.service

pacman -S noto-fonts-cjk    # chinese font
pacman -S noto-fonts-emoji


# wifi
sudo systemctl start iwd
sudo iwctl station wlan0 connect wifi_name
vi /etc/iwd/main.conf
# [General]
# EnableNetworkConfiguration=true
# DNS
sudo systemctl enable systemd-resolved.service 

# sudo nmcli dev wifi connect Italia_5G password ""

########################################################################################
# pipewire
pacman -S pipewire
systemctl --user enable pipewire.service
systemctl --user start pipewire.service

# sound card
sudo pacman -S sof-firmware

# bluetooth headset
# set "ControllerMode = bredr" in /etc/bluetooth/main.conf
sudo pacman -S pipewire-pulse
########################################################################################
