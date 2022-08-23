#!/bin/bash

source input.sh
source data.sh
source color.sh

if [ $flag -eq 0 ]; then
    SYSTEMDATA=$(Sysinfo)
    echo "$SYSTEMDATA"
    echo -en '\n'
    if [ $def -eq 1 ];
        then
            a=default
            b=default
            c=default
            d=default
    fi
    echo "Column 1 background = $a (`(ShowColor1)`)"
    echo "Column 1 font color = $b (`(ShowColor2)`)"
    echo "Column 2 background = $c (`(ShowColor3)`)"
    echo "Column 2 font color = $d (`(ShowColor4)`)"
fi
