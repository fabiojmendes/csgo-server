#!/bin/bash

: ${SSH_KEY_ID:=$(doctl compute ssh-key list --no-header --format ID)}

echo "Using key $SSH_KEY_ID"

doctl compute droplet create csgo-server \
    --size s-2vcpu-2gb-intel \
    --image ubuntu-20-04-x64 \
    --enable-monitoring \
    --region tor1 \
    --ssh-keys $SSH_KEY_ID \
    --user-data "$(envsubst < user-data.sh)"

echo "Droplet provisioned"
