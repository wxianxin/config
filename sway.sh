#!/bin/bash
# sway

sudo pacman -S sway swaybg swayidle swaylock foot 

mkdir -p .config/sway
cp /etc/sway/config .config/sway
cp ~/config/sway/* .config/sway

# Add single or double quotes to the first delimiter to ignore variable and command expansion in a HereDoc
cat >> ~/.config/sway/config << "EOF"
########################################################################################
# Steven
output * bg ~/config/static/colorful.jpg fill 

input * accel_profile flat
input * pointer_accel -0.5

bindsym $mod+0 exec bash ~/.config/sway/lock.sh 

exec swayidle -w \
         timeout 480 'swaylock -f -c 000000' \
         timeout 490 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
         before-sleep 'swaylock -f -c 000000'
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



# ~/.config/sway/config
# bar {
#     position top
#     mode hide
# 
#     # When the status_command prints a new line to stdout, swaybar updates.
#     # The default just shows the current date and time.
#     status_command while date +'%Y-%m-%d %H:%M:%S'; do sleep 1; done
# 
#     colors {
#         statusline #00ff00
#         background #000000
#         inactive_workspace #32323200 #32323200 #5c5c5c
#     }
# }
