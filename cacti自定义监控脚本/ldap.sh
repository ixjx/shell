#!/bin/bash
# $1 : hostname or ip

a=`nmap $1 -p 389 | awk 'NR==6{print $2}'`

if [ $a = "open" ]
then
	echo "state:1"
else
	echo "state:0"
fi
