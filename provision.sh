#!/bin/bash


up() {
    : ${SSH_KEY_ID:=$(doctl compute ssh-key list --no-header --format ID)}

    echo "Using key id $SSH_KEY_ID"

    doctl compute droplet create csgo-server \
        --size s-2vcpu-2gb-intel \
        --image ubuntu-20-04-x64 \
        --enable-monitoring \
        --region tor1 \
        --ssh-keys $SSH_KEY_ID \
        --wait \
        --user-data "$(envsubst < user-data.sh)"

    echo "Droplet provisioned $DYNAV6_HOST "
}

down() {
    echo "Bringing server down"
    doctl compute droplet delete -f --verbose csgo-server
}

usage() {
    echo "Usage $0 <up|down>"
}

case $1 in
    "up")
        up
    ;;
    "down")
        down
    ;;
    *)
        usage
    ;;
esac
