#!/bin/sh

GW=$(/sbin/route -n | /usr/bin/awk '{print $2}' | /bin/grep 172 | /usr/bin/head -n 1) 

/sbin/route add -net 172.16.0.0 netmask 255.255.0.0 gw $GW
