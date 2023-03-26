sudo cryptsetup -v luksOpen /dev/nvme0n1p1 L
sudo mount /dev/mapper/L drive
sudo chown -R $USER:$USER /dev/mapper/L

sudo nmcli dev disconnect wlo1

sudo systemctl start nfs-server.service
sudo systemctl start target.service
sudo systemctl start docker.service
sudo docker compose -f config/docker-compose.yaml up -d

