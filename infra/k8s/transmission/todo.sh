cat /proc/sys/net/ipv4/conf/all/src_valid_mark
sudo sysctl -w net.ipv4.conf.all.src_valid_mark=1
# or permenantly
cat "net.ipv4.conf.all.src_valid_mark=1" >> /etc/sysctl.conf
