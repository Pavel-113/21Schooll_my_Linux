#!/bin/bash
. ./color.sh

function color {
    echo -e "${back[$left__background_color]}${font[$left_font_color]}$1 ${breakColor}""${back[$right_background_color]}${font[$right_font_color]}$2$3 ${breakColor}"
}

function Sysinfo {
  color "HOSTNAME" = "`hostname`"
  color "TIMEZONE" = "`cat /etc/timezone` UTC `date +%Z`"
  color "USER" = "`whoami`"
  color "OS" = "`cat /etc/issue | head -n 1 | awk '{print $1, $2}'`"
  color "DATE" = "`date +"%d %b %Y %T"`"
  color "UPTIME" = "`uptime -p`"
  color "UPTIME_SEC" = "`cat /proc/uptime | awk '{print $1 }'` sec"
  color "IP" = "`hostname -I | awk '{print $1}'`"
  color "MASK" = "$(ifconfig | grep `hostname -I | awk '{print $1}'` | awk '{print $4}')"
  color "GATEWAY" = "$(ip r | grep default | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | head -n 1)"
  color "RAM_TOTAL" = "`free | grep Mem: | awk '{printf "%.3f Gb" ,$2/1024/1024}'`"
  color "RAM_USED" = "`free | grep Mem: | awk '{printf "%.3f Gb" ,$3/1024/1024}'`"
  color "RAM_FREE" = "`free | grep Mem: | awk '{printf "%.3f Gb" ,$4/1024/1024}'`"
  color "SPACE_ROOT" = "`df -k | grep /$ | awk '{printf "%.2f Mb", $2/1024}'`"
  color "SPACE_ROOT_USED" = "`df -k | grep /$ | awk '{printf "%.2f Mb", $3/1024}'`"
  color "SPACE_ROOT_FREE" = "`df -k | grep /$ | awk '{printf "%.2f Mb", $4/1024}'`"
}