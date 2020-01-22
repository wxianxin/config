# The existence of this script is because transmission always loads setting in /etc/... during boot. This script refreshes its setting from the user space.

sudo mount /dev/nvme0n1p1 ~/L
sudo service transmission-daemon stop
transmission-daemon

