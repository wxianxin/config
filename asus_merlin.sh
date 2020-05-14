# Tested on Asus Merlin

opkg install vim
opkg install transmission-daemon-openssl transmission-remote-openssl # transmission-web
# Edit config
/opt/etc/init.d/S88transmission stop
vim /opt/etc/transmission/settings.json
