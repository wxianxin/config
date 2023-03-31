#!/bin/bash
# sway

sudo pacman -S sway swaybg swayidle swaylock foot 

mkdir -p .config/sway
cp /etc/sway/config .config/sway
cp ~/config/sway/* .config/sway

# Add single or double quotes to the first delimiter to ignore variable and command expansion in a HereDoc
cat >> ~/.bashrc << "EOF"
################################################################
# sway

# start sway on tty login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
fi

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

EOF

