sudo cryptsetup -v luksOpen /dev/nvme0n1p1 L
sudo mount /dev/mapper/L drive
sudo chown -R coupe:coupe /dev/mapper/L

sudo nmcli dev disconnect wlo1

sudo systemctl start nfs-server.service
sudo systemctl start target.service
