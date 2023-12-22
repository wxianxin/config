sudo lsblk -o name,mountpoint,label,size,uuid
########################################################################################
# nfs
sudo pacman -S nfs-utils
sudo systemctl stop nfs-server.service      # v3
sudo systemctl start nfs4-server.service    # v4
echo "/nfs/exports/myshare 192.168.122.0/24(rw,sync)" > /etc/exports
# for k8s cluster access: 
echo "/nfs/exports/nfs_share 192.168.122.0/24(rw,sync,anonuid=1000,anongid=1000)" > /etc/export
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
# install targetcli-fb

# create new block
## block device
/backstores/block> create dev=/dev/sdxx name=sdxx
### same as 
/backstores/block> create sdxx /dev/sdxx

# create iSCSI target
# naming rule : [ iqn.(year)-(month).(reverse of domain name):(description: any name you like) ]
/iscsi> create wwn=iqn.2022-11.stevenwang.trade:drive

# create ACL(Access Control List)
/iscsi> cd iqn.2022-11.stevenwang.trade:drive/tpg1/acls
/iscsi/iqn.20...ers/tpg1/acls> create wwn=iqn.2022-11.stevenwang.trade:node01.initiator01

# add LUN (point target to the actual storage resource)
cd iscsi/iqn.2022-11.stevenwang.trade:drive/tpg1/luns
    create /backstores/block/sdxx

# authentication
# turn on authentication
/iscsi/iqn.20...00:drive/tpg1> set attribute authentication=1
# turn off authentication
/iscsi/iqn.20...00:drive/tpg1> set attribute authentication=0

# !!! open up the port 3260 in the firewall
########################################
# initiator side
# install open-iscsi
sudo systemctl start iscsid.service

# Target discovery: Request the target its nodes.
iscsiadm --mode discovery --type sendtargets --portal 192.168.0.0 --discover

# set initiator name
echo "InitiatorName=iqn.2022-11.stevenwang.trade:node01.initiator01" >> /etc/iscsi/initiatorname.iscsi
# set username and password
sudo vim /etc/iscsi/iscsid.conf 

sudo systemctl restart iscsid.service

# Add target manually
iscsiadm --mode node --targetname iqn.2022-11.stevenwang.trade:drive --portal 192.168.0.0 --login
# logout
iscsiadm --mode node --targetname iqn.2022-11.stevenwang.trade:drive --portal 192.168.0.0 -u
########################################################################################
# mariaDB/MySQL
CREATE DATABASE database_name;
DROP DATABASE database_name;

SELECT User, Host FROM mysql.user;  # show all users;
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'username'@'10.0.0.0/255.0.0.0' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost' IDENTIFIED BY 'password';
REVOKE type_of_permission ON database_name.table_name FROM 'username'@'host';
SHOW GRANTS FOR 'username'@'host';
FLUSH PRIVILEGES;
DROP USER 'username'@'localhost';
mysqldump -u root -p xxx_db > xxx.sql_dump
