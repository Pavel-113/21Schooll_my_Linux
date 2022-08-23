#!/bin/bash

left__background_color=$1
left_font_color=$2
right_background_color=$3
right_font_color=$4

# цвет текста
WHITE='\033[37m'
RED='\033[31m'
GREEN='\033[32m'
BLUE='\033[34m'
PURPLE='\033[35m'
BLACK='\033[30m'

# цвет фона
BGWHITE='\033[47m'
BGRED='\033[41m'
BGREEN='\033[42m'
BGBLUE='\033[44m'
BGPURPLE='\033[45m'
BGBLACK='\033[40m'

# все атрибуты по умолчанию
breakColor='\e[0m'

font=([1]=$WHITE [2]=$RED [3]=$GREEN [4]=$BLUE [5]=$PURPLE [6]=$BLACK)
back=([1]=$BGWHITE [2]=$BGRED [3]=$BGREEN [4]=$BGBLUE [5]=$BGPURPLE [6]=$GBLACK)