#!/bin/bash

LOG=/root/log1

dateNow=$(tail -n1 $LOG | awk '{print $1}')

awk -v dateNow="$dateNow" '
{ sec=int(dateNow)-int($1);
if (sec<=120 && int($2)>=1) {print "loadavg1 < 1"; exit 1;}
else if (sec<=180 && int($5)/int($6)*100>=60) {print "memfree / memtotal < 60%"; exit 1;}
else if (sec<=300 && int($7)/int($8)*100<=60) {print "diskfree / disktotal < 60%"; exit 1;}
}' "$LOG"
