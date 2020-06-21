# sudo mount /dev/nvme0n1p5 ~/L
# sudo mount -o rsize=32768,wsize=32768 192.168.1.1:/home/pi/L ~/nfs
sudo mount -t cifs -o username=sysxadmin,uid=coupe,vers=2.0 //192.168.50.1/drive ~/L/Downloads

# restart the service because it won't read user specific settings right after boot
sudo service transmission-daemon stop
transmission-daemon

# rsync -aP -e "ssh -p 22" /home/coupe/L/Downloads/blabla pi@192.168.1.1:/home/pi/L/Downloads
# python -m http.server 8000


