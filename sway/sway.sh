#!/bin/bash
# sway

sudo pacman -S sway swaybg swayidle swaylock foot # wofi
# wofi has too much dependency

# screenshot
sudo pacman -S grim slurp

sudo usermod -aG seat coupe
sudo systemctl enable seatd.service

mkdir -p .config/sway
cp /etc/sway/config .config/sway
cp ~/config/sway/* .config/sway
mkdir -p .config/foot
cp /etc/xdg/foot/foot.ini .config/foot/foot.ini
# font=SourceCodePro:size=16

# Add single or double quotes to the first delimiter to ignore variable and command expansion in a HereDoc
cat >> ~/.bashrc << "EOF"
################################################################
# sway

# start sway on tty login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
fi
EOF

