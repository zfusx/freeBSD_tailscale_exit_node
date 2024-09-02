# freeBSD_tailscale_exit_node
how to setup exit node of tailscale on FreeBSD 14

This is upgrade version from https://github.com/tailscale/tailscale/issues/10024

1. run setup.sh to add derp server list (something like relay server), before running change 192.168.9.1 to your getway it should be 192.168.1.1 
run: netstat -rn to get getway ip

2. run run.sh to load tailscale with exit node, change exit node ip to your own one.

3. run off.sh to reset the network and turn off tailscale
