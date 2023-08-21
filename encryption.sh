# encrypt
sudo cryptsetup luksFormat --type luks1 /dev/nvme0n1p1 

# use cryptsetup to create a mapper for the actual drive
sudo cryptsetup -v luksOpen /dev/nvme0n1p1 L
# We can treat "L" as our encrypted partition. Therefore, we can mount it anywhere we want
mkfs.btrfs /dev/mapper/L
sudo mount /dev/mapper/L
sudo chown -R username:username /dev/mapper/L

# SSH
ssh-keygen -t ed25519
ssh-copy-id -i ~/.ssh/tatu-key-ecdsa user@host
