#!/bin/bash

init=`snmpwalk -v 2c -c cnt2001jsB 192.168.251.170 .1.3.6.1.4.1.4491.2.1.20.1.3.1.6 | grep "INTEGER: 2" | wc -l`

echo casa_init:$init
