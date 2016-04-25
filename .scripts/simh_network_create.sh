#!/bin/sh
HOSTIP=`ip -4 a show eth0 | grep "inet" | gawk -- '{ print $2 }' | gawk -F / -- '{ print $1 }'`
# HOSTNETMASK=`ip -4 a show eth0 | grep "inet" | gawk -- '{ print $2 }' | gawk -F / -- '{ print $2 }' | sed 's/8/255.0.0.0/;s/16/255.255.0.0/;s/24/255.255.255.0/;s/32/255.255.255.255/'`
HOSTNETMASK=`ip -4 a show eth0 | grep "inet" | gawk -- '{ print $2 }' | gawk -F / -- '{ print $2 }'`
HOSTBCASTADDR=`ip -4 a show eth0 | grep "inet" | gawk -- '{ print $4 }' | gawk -F / -- '{ print $1 }'`
HOSTDEFAULTGATEWAY=`ip route | grep ^default | gawk -- '{ print $3 }'`
#
# /usr/sbin/tunctl -t tap0 [-u someuser]
ip tuntap add dev tap0 mode tap
ip link set dev tap0 up
#
# Now convert eth0 to a bridge and bridge it with the TAP interface
/sbin/brctl addbr br0
/sbin/brctl addif br0 eth0
/sbin/brctl setfd br0 0
ip addr flush dev eth0
ip address add $HOSTIP/$HOSTNETMASK broadcast $HOSTBCASTADDR dev br0
ip link set dev br0 up
# set the default route to the br0 interface
ip route add default via $HOSTDEFAULTGATEWAY
# bridge in the tap device
/sbin/brctl addif br0 tap0
ip addr flush dev tap0

# Run simulator and "attach xq tap:tap0"
