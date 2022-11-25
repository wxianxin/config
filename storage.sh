# sudo mount /dev/nvme0n1p5 ~/L
# sudo mount -o rsize=32768,wsize=32768 192.168.1.1:/home/pi/L ~/nfs
sudo mount -t cifs -o username=sysxadmin,uid=coupe,vers=2.0 //192.168.0.0/drive ~/L/Downloads
# sudo apt install curlftpfs
# curlftpfs -o user={$USERNAME}:{$PASSWORD} 192.168.00.1/Seagate_Backup_Plus_Drive/drive ~/L/Downloads

# restart the service because it won't read user specific settings right after boot
sudo service transmission-daemon stop
transmission-daemon

# rsync -aP -e "ssh -p 22" /home/coupe/L/Downloads/blabla pi@192.168.1.1:/home/pi/L/Downloads
# python -m http.server 8000


########################################################################################
# iSCSI
########################################################################################
########################################
## target side

# create new block
## block device
/backstores/block> create dev=/dev/sdxx name=sdxx

# create iSCSI target
# naming rule : [ iqn.(year)-(month).(reverse of domain name):(description: any name you like) ]
/iscsi> create wwn=iqn.2022-11.stevenwang.trade:drive

# create ACL(Access Control List)
/iscsi> cd iqn.2022-11.stevenwang.trade:drive/tpg1/acls
/iscsi/iqn.20...ers/tpg1/acls> create wwn=iqn.2022-11.stevenwang.trade:node1

# add LUN
cd iscsi/iqn.2022-11.stevenwang.trade:drive/tpg1/luns
    create /backstores/block/sdxx

# !!! open up the port 3260 in the firewall
########################################
# initiator side

# Target discovery: Request the target its nodes.
iscsiadm --mode discovery --type sendtargets --portal 192.168.0.0 --discover

# Add target manually
iscsiadm --mode node --targetname iqn.2022-11.stevenwang.trade:drive --portal 192.168.0.0 --login
# logout
iscsiadm --mode node --targetname iqn.2022-11.stevenwang.trade:drive --portal 192.168.0.0 -u
########################################################################################
