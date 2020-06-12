echo "########">> ~/.bashrc
echo "# Steven">> ~/.bashrc
echo "alias python="python3"">> ~/.bashrc
echo "alias dropbox=~/.dropbox-dist/dropboxd">> ~/.bashrc
echo "alias tms='transmission-remote --auth transmission:password'" >> ~/.bashrc
echo "source ~/.venvs/p/bin/activate" >> ~/.bashrc

cp -r ~/config/.vim ..
cp ~/config/.vimrc ..
cp ~/config/.toprc ..

sudo dnf install vim
# sudo dnf install mplayer
# sudo dnf install openssh-server
# sudo dnf install transmission-daemon

sudo dnf autoremove

# sudo reboot

# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

# sudo mount /dev/nvme0n1p5 /home/coupe/L/

########################################################################################
# Dell G5 SE 
# sudo grubby --update-kernel=ALL --args="amdgpu.runpm=0"
########################################################################################
