########################################################################################
# docker
########################################################################################

# docker
docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e TZ="America/New_York" \
  -v /home/coupe/config/docker/home_assistant \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable
