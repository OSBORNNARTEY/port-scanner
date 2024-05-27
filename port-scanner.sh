#!/bin/bash

if ["$1" == ""]
then
echo "You forgot to enter the IP Address"
echo "Syntax: ./port-scanner.sh 192.168.4"

else
for ip in `seq 1 254` ; do
ping -c 1 $1.$pip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi
