# ssh
ssh-keygen -t ed25519
ssh-copy-id -i ~/.ssh/key.pub user@host
vim /etc/ssh/sshd_config

# add key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# encrypt
sudo cryptsetup luksFormat --type luks1 /dev/nvme0n1p1 

# use cryptsetup to create a mapper for the actual drive
sudo cryptsetup -v luksOpen /dev/nvme0n1p1 L
# We can treat "L" as our encrypted partition. Therefore, we can mount it anywhere we want
mkfs.btrfs /dev/mapper/L
sudo mount /dev/mapper/L
sudo chown -R username:username /dev/mapper/L

# $type$salt$hashed
openssl passwd -1 -salt xxxxxxxx password
echo -n "your_password" | openssl passwd -6 -stdin -salt "your_salt"

# compress and encrypt
tar -czvf folder_name.tar.gz /path/to/folder_name
gpg -c folder_name.tar.gz   # -c specifies symmetric encryption
rm folder_name.tar.gz
# decrypt and uncompress
gpg folder_name.tar.gz.gpg
tar -xzvf folder_name.tar.gz

