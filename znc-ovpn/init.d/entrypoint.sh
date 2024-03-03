#!/bin/bash
#

# Creating the tun interface
mkdir -p /dev/net
mknod /dev/net/tun c 10 200

# Starting OpenVPN
openvpn /startup/example.ovpn &

# Starting znc
sudo -u admin znc -d /config

tail -f /dev/null
