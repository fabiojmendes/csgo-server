#!/bin/bash

ufw limit ssh
ufw allow 27015
ufw -f enable

apt-get -y update && apt-get -y install docker.io

docker run -d --net=host --name=csgo-dedicated \
    -e SRCDS_TOKEN=$TOKEN \
    -e SRCDS_PW=$PW \
    -e SRCDS_RCONPW=$PW \
    -e SRCDS_GAMEMODE=0 \
    -e SRCDS_HOSTNAME="Buddies CSGO Server" \
    cm2network/csgo

echo "Instalation Finished"
