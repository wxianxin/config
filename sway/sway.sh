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
export MOZ_ENABLE_WAYLAND=1

# start sway on tty login
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
fi
EOF

cat >> ~/.config/sway/config << "EOF"
########################################################################################
# Steven
output * bg ~/config/static/colorful.jpg fill 

input * accel_profile flat
input * pointer_accel -0.5

set $menu wofi --show=drun --lines=5 --prompt="hello world"

bindsym $mod+0 exec bash ~/.config/sway/lock.sh
F86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindsym XF86AudioMicMute exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

exec swayidle -w \
         timeout 360 'swaylock -f -c 880000' \
         timeout 370 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
         before-sleep 'swaylock -f -c 008800'
EOF



# ~/.config/sway/config
# bar {
#     position top
#     mode hide
#     modifier Mod1
# 
#     # When the status_command prints a new line to stdout, swaybar updates.
#     # The default just shows the current date and time.
#     status_command while ~/.config/sway/status.sh; do sleep 1; done
# 
#     colors {
#         statusline #00ff00
#         background #00000000
#         inactive_workspace #32323200 #32323200 #5c5c5c
#     }
# }
