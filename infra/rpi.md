# burn image
xz -d xxx.img.xz
sudo dd if=xxx.img of=/dev/sda bs=4M conv=fsync status=progress

# enable ssh
## in boot partition
vim userconf.txt

    username:encrypted-password-hash

### to get the password hash
echo 'mypassword' | openssl passwd -6 -stdin

# disable swap
sudo systemctl disable dphys-swapfile.service

# set up network privilege for wireguard-transmission
cat /proc/sys/net/ipv4/conf/all/src_valid_mark
sudo sysctl -w net.ipv4.conf.all.src_valid_mark=1
# or permenantly
cat "net.ipv4.conf.all.src_valid_mark=1" >> /etc/sysctl.conf
