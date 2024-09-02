#!/bin/sh
set -e

# Ensure Tailscale is running
if ! service tailscaled onestatus; then
  service tailscaled onestart
  sleep 3
fi

# Display Tailscale status
tailscale status

# Fetch list of DERP server IPs
ips=$(fetch -q -o - https://login.tailscale.com/derpmap/default | fx 'Object.values(x.Regions).flatMap(r => r.>

# Add routes for DERP servers
for ip in $ips; do
  route add $ip 192.168.9.1
done

# Change the default route to use Tailscale
route delete default
route add default -iface tailscale0

# Check the new public IP
fetch -q -o - https://jsonip.com
echo







