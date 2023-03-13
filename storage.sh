########################################################################################
# nfs
sudo pacman -S nfs-utils
sudo systemctl stop nfs-server.service      # v3
sudo systemctl start nfs4-server.service    # v4
echo "/nfs/exports/myshare 192.168.122.0/24(rw,sync)" > /etc/exports
# rw: enable read and write
# sync: confirm write operation completed before server responds back to client, better data integrity, slightly worse performance.

# sudo mount -o rsize=32768,wsize=32768 192.168.1.1:/home/pi/L ~/nfs
########################################################################################
# samba
sudo mount -t cifs -o username=sysxadmin,uid=coupe,vers=2.0 //192.168.0.0/drive ~/L/Downloads

########################################################################################
# restart the service because it won't read user specific settings right after boot
sudo service transmission-daemon stop
transmission-daemon

########################################################################################
# rsync
rsync -avzP -e "ssh -p 9022 -i /path/to/private_key" /home/user/blabla pi@192.168.1.1:/home/pi/target
# "-a" means "archive mode" and is used to preserve permissions, ownership, timestamps, and other attributes of the files being synced. It is equivalent to using "-rlptgoD".
# "-v" means "verbose" and is used to display detailed information about the files being synced.
# "-z" means "compress" and is used to compress the data being transferred, which can reduce the amount of data sent over the network.
# "-P" means "progress" and is used to display a progress bar during the sync, as well as to allow for the resumption of interrupted transfers.

########################################################################################
# python -m http.server 8000

########################################################################################
# iSCSI
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
