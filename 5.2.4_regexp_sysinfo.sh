#!/bin/bash

#la=$(cat /proc/loadavg | awk '{(print $i1+$2+$3)/3}')
#la=$(cat /proc/loadavg)
while [[ 1 -eq 1  ]]; do
date=$(date +"%s")
la1=$(cat /proc/loadavg | awk '{print $1}')
la5=$(cat /proc/loadavg | awk '{print $2}')
la15=$(cat /proc/loadavg | awk '{print $3}')
memfree=$(free | grep Mem | awk '{print $4}')
memtotal=$(free | grep Mem | awk '{print $2}')
diskfree=$(df | grep -E "/$" |  awk '{print $4}')
disktotal=$(df | grep -E "/$" |  awk '{print $2}')
echo "$date $la1 $la5 $la15 $memfree $memtotal $diskfree $disktotal" >> $1
sleep 5
done
