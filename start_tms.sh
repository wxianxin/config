sudo mount /dev/nvme0n1p5 ~/L
# restart the service because it won't read user specific settings right after boot
sudo service transmission-daemon stop
transmission-daemon
