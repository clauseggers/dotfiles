#!/bin/sh
# Restore network by removing the interfaces that were set up for SimH
# and then restoring the standard fixed IP `eth0` interface.

# Down and delete the bridge
ip link set dev br0 down
/sbin/brctl delbr br0

# Down and delete the tap
ip link set dev tap0 down
ip link delete dev tap0

# Restore et0 to its static IP configuration
ip addr add 192.168.1.80/24 broadcast 192.168.1.255 dev eth0
ip link set dev eth0 up

# Restart the network service
systemctl restart networking.service
