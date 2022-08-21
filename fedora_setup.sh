#!/bin/bash
# DO NOT sudo execute this script

########################################################################################
# python
sudo dnf install flake8 # for vim ale
########################################################################################
sudo dnf install vim
# sudo dnf install mplayer
# sudo dnf install openssh-server
# sudo dnf install transmission-daemon

sudo dnf autoremove
########################################################################################
rm -r ~/Documents
rm -r ~/Music
rm -r ~/Pictures
rm -r ~/Public
rm -r ~/Templates
rm -r ~/Videos
########################################################################################
# Dell G5 SE 
# sudo grubby --update-kernel=ALL --args="amdgpu.runpm=0"
########################################################################################
