########################################################################################
# docker
########################################################################################

# docker images # show all images

# configuration path: drive/container/
########################################################################################
sudo systemctl start docker.service

# homeassistant
sudo docker run -d \
  --name=homeassistant \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ="America/New_York" \
  -p 8123:8123 `#optional` \
  -v /home/coupe/drive/container/homeassistant_config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/homeassistant:latest


# jellyfin
sudo docker run -d \
  --name=jellyfin \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ="America/New_York" \
  -p 8096:8096 \
  -v /home/coupe/drive/container/jellyfin_config:/config \
  -v /home/coupe/drive/downloads:/data/media \
  --restart unless-stopped \
  lscr.io/linuxserver/jellyfin:latest


# transmission
sudo docker run -d \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ="America/New_York" \
  -e TRANSMISSION_WEB_HOME= `#optional` \
  -e USER= `#optional` \
  -e PASS= `#optional` \
  -e WHITELIST= `#optional` \
  -e PEERPORT= `#optional` \
  -e HOST_WHITELIST= `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /home/coupe/drive/container/transmission_config:/config \
  -v /home/coupe/drive/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/transmission:latest
