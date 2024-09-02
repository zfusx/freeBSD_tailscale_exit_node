#!/bin/sh

#change 100.104.x.x to your own exit node
tailscale up --exit-node=100.104.x.x --reset

route delete default
route add default -iface tailscale0


echo "nameserver 100.100.100.100" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf