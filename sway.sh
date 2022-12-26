#!/bin/bash
# sway

sudo pacman -S sway foot

mkdir .config/sway
# mkdir -p .config/sway
cp /etc/sway/config .config/sway

# .config/sway/config
cat >> ~/.config/sway/config << EOF
########################################################################################
input * accel_profile flat
EOF

# Add single or double quotes to the first delimiter to ignore variable and command expansion in a HereDoc
cat >> ~/.bashrc << "EOF"
################################
# sway
export MOZ_ENABLE_WAYLAND=1

# start sway on tty login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
fi
EOF

