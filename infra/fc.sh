sudo mount -o rsize=32768,wsize=32768 192.168.31.12:/home/coupe/drive ~/L
sudo systemctl start iscsid.service
sudo iscsiadm --mode node --targetname iqn.2023-06.stevenwang.trade:drive --portal 192.168.50.64 --login
