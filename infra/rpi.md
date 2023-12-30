# burn image
xz -d xxx.img.xz
sudo dd if=xxx.img of=/dev/sda bs=4M conv=fsync status=progress

# enable ssh
## in boot partition
vim userconf.txt
    username:encrypted-password-hash

### to get the password hash
echo 'mypassword' | openssl passwd -6 -stdin

