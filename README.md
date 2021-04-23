```
doctl compute droplet create csgo-server \
    --size s-2vcpu-2gb-intel \
    --image ubuntu-20-04-x64 \
    --enable-monitoring \
    --region tor1 \
    --ssh-key $SSH_KEY_ID \
    --user-data "$(envsubst < script.sh)"
```
