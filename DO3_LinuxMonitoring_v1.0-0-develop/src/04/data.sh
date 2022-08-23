#!/bin/bash

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

function ShowColor1 {
    if [[ $a == 1 ]]
    then 
	    echo "white"
    elif [[ $a == 2 ]]
    then
	    echo "red"
    elif [[ $a == 3 ]]
    then
            echo "green"
    elif [[ $a == 4 ]]
    then
            echo "blue"
    elif [[ $a == 5 ]]
    then
            echo "purple"
    elif [[ $a == 6 ]]
    then
            echo "black"
    else 
	    echo "purple"
    fi
}

function ShowColor2 {
    if [[ $b == 1 ]]
    then
	    echo "white"
    elif [[ $b == 2 ]]
    then
	    echo "red"
    elif [[ $b == 3 ]]
    then
            echo "green"
    elif [[ $b == 4 ]]
    then
            echo "blue"
    elif [[ $b == 5 ]]
    then
            echo "purple"
    elif [[ $b == 6 ]]
    then
            echo "black"
    else
	    echo "black"
    fi
}

function ShowColor3 {
    if [[ $c == 1 ]] 
    then 
	    echo "white"
    elif [[ $c == 2 ]]
    then
	    echo "red"
    elif [[ $c == 3 ]]
    then
            echo "green"
    elif [[ $c == 4 ]]
    then
            echo "blue"
    elif [[ $c == 5 ]]
    then
            echo "purple"
    elif [[ $c == 6 ]]
    then
            echo "black"
    else 
	    echo "black"
    fi
}

function ShowColor4 {
    if [[ $d == 1 ]] 
    then 
	    echo "white"
    elif [[ $d == 2 ]]
    then
	    echo "red"
    elif [[ $d == 3 ]]
    then
            echo "green"
    elif [[ $d == 4 ]]
    then
            echo "blue"
    elif [[ $d == 5 ]]
    then
            echo "purple"
    elif [[ $d == 6 ]]
    then
            echo "black"
    else 
	    echo "purple"
    fi
}
