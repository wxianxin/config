sudo cryptsetup -v luksOpen /dev/nvme0n1p1 L
sudo mount /dev/mapper/L drive
sudo chown -R $USER:$USER /dev/mapper/L

# sudo nmcli dev disconnect wlo1
sudo ip link set wlan0 down

sudo systemctl start nfs-server.service
sudo systemctl start target.service
sudo systemctl start docker.service
sudo docker compose -f config/docker-compose.yaml up -d

# backup job
sudo cryptsetup -v luksOpen /dev/sdc1 B
sudo mount /dev/mapper/B mnt
sudo chown -R $USER:$USER /dev/mapper/B
rsync -ahzP --progress /home/$USER/drive/ /home/$USER/mnt/backup/drive/ | tee /home/$USER/mnt/backup/backup.log
sudo umount /home/$USER/mnt
sudo cryptsetup luksClose /dev/mapper/B
