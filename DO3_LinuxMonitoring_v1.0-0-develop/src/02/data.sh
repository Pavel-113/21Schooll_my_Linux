#!/bin/bash

echo HOSTNAME = `hostname`
echo TIMEZONE = `cat /etc/timezone` UTC `date +%Z`
echo USER = `whoami`
echo OS = `cat /etc/issue | head -n 1 | awk '{print $1, $2}'`
echo DATE = `date +"%d %b %Y %T"`
echo UPTIME = `uptime -p `
echo UPTIME_SEC = `cat /proc/uptime | awk '{print $1 }'` sec
echo IP = `hostname -I | awk '{print $1}'`
#echo MASK =  $(netstat -rn) | awk '{print $1,$2,$33}'
echo MASK = $(ifconfig | grep `hostname -I | awk '{print $1}'` | awk '{print $4}')
#echo MASK =  $(netstat -rn) | awk '{print $1,$2,$25}'
echo GATEWAY = $(ip r | grep default | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | head -n 1)
#echo GATEWAY = `ip route | head -n 1| awk '{print $3}'`
echo RAM_TOTAL = `free | grep Mem: | awk '{printf "%.3f Gb" ,$2/1024/1024}'`
echo RAM_USED = `free | grep Mem: | awk '{printf "%.3f Gb" ,$3/1024/1024}'`
echo RAM_FREE = `free | grep Mem: | awk '{printf "%.3f Gb" ,$4/1024/1024}'`
echo SPACE_ROOT = `df -k | grep /$ | awk '{printf "%.2f Mb", $2/1024}'`
echo SPACE_ROOT_USED = `df -k | grep /$ | awk '{printf "%.2f Mb", $3/1024}'`
echo SPACE_ROOT_FREE = `df -k | grep /$ | awk '{printf "%.2f Mb", $4/1024}'`