# CSGO Server Provisioning
Simple script to automate the creation of a csgo using [Digital Ocean](www.digitalocean.com)

This script is based on the [CSGO Server](https://github.com/CM2Walki/CSGO) image from https://github.com/CM2Walki

# Requirements

[doctl](https://github.com/digitalocean/doctl/) tool installed and authenticated with
```
doctl auth init
```

# Environment Variables

You need to set these environment variables before running the provisioning script.

To generate a SRCDS_TOKEN you can use [Steam Server Token](https://steamcommunity.com/dev/managegameservers)
```
export SRCDS_TOKEN="token"
export SRCDS_HOSTNAME="Name for the server"
export SRCDS_PW="server password"
export SRCDS_RCONPW="rcon password"
```

## Optional:

[dynav6](https://dynv6.com/) dynamic dns
```
export DYNAV6_TOKEN="token"
export DYNAV6_HOST="dynav6 hostname"
```

# Usage

```
./provision.sh
```
