# CS:GO Server Provisioning
Simple script to automate the creation of a CS:GO dedicated server on [Digital Ocean](www.digitalocean.com)

This script is uses the [CSGO Server](https://github.com/CM2Walki/CSGO) docker image from https://github.com/CM2Walki

# Requirements

[doctl](https://github.com/digitalocean/doctl/) tool installed and authenticated with
```
doctl auth init
```

# Environment Variables

You need to set these environment variables before running the provisioning script.

To generate a SRCDS_TOKEN you can use [Steam Server Token](https://steamcommunity.com/dev/managegameservers) with the app id 730.
```
export SRCDS_TOKEN="token"
export SRCDS_HOSTNAME="Name for the server"
export SRCDS_PW="server password"
export SRCDS_RCONPW="rcon password"
```

## dynav6:
I'm using [dynav6](https://dynv6.com/) dynamic dns to provide a name for the server but this is optional.
```
export DYNAV6_TOKEN="token"
export DYNAV6_HOST="dynav6 hostname"
```

# Usage

```
./provision.sh
```

# References

https://docs.digitalocean.com/products/droplets/how-to/provide-user-data/
https://hub.docker.com/r/cm2network/csgo/
https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers
https://www.linode.com/docs/guides/launch-a-counter-strike-global-offensive-server-on-ubuntu-18-04/
