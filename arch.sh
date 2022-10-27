# arch install

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

echo archname > /etc/hostname
pacman -S grub efibootmgr os-prober
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

pacman -S networkmanager
pacman -S gdm gnome-terminal
pacman -S gnome-control-center
pacman -S nautilus
# pacman -S gvfs-smb # smb for nautilus

pacman -S bluez bluez-utils
pacman -S noto-fonts-cjk    # chinese font

# autostart
systemctl enable gdm.service
systemctl enable NetworkManager.service
systemctl enable bluetooth.service

# wifi
sudo systemctl start iwd & sudo iwctl station wlan0 connect Italia_5G & sudo dhcpcd wlan0
# sudo nmcli dev wifi connect Italia_5G password ""

