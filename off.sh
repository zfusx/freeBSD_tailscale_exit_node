#!/bin/sh

# Bring Tailscale down
echo "Bringing Tailscale down..."
tailscale down

# Sleep for 3 seconds to allow the system to process the command
echo "Waiting for 3 seconds..."
sleep 3

# Restore the default gateway
echo "Restoring default gateway..."
route delete default
route add default 192.168.9.1

# Restore DNS settings
echo "Restoring DNS settings..."
echo "nameserver 192.168.9.1" > /etc/resolv.conf

# Confirm the changes
echo "Network configuration after restoring:"
netstat -rn
echo "DNS configuration:"
cat /etc/resolv.conf

echo "Tailscale is down and the original network settings are restored."
