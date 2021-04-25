#!/bin/bash

# Setup firewall
ufw limit ssh
ufw allow 27015
ufw -f enable

# Update dynamic DNS
if [[ -n "$DYNAV6_TOKEN" ]]; then
    echo "Updating dynv6 hostname"
    curl "https://ipv4.dynv6.com/api/update" -sSiG  \
        -d ipv4=auto \
        -d token="$DYNAV6_TOKEN" \
        -d hostname="$DYNAV6_HOST"
fi

# Install Docker
apt-get -y update && apt-get -y install docker.io

# Run CSGO Server
docker run -d --net=host --name=csgo-dedicated \
    -e SRCDS_TOKEN="$SRCDS_TOKEN" \
    -e SRCDS_PW="$SRCDS_PW" \
    -e SRCDS_RCONPW="$SRCDS_RCONPW" \
    -e SRCDS_GAMEMODE="0" \
    -e SRCDS_HOSTNAME="$SRCDS_HOSTNAME" \
    cm2network/csgo

echo "Instalation Finished"
