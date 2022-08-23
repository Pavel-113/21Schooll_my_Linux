#!/bin/bash
. ./data.sh
. ./color.sh

if [ $# -ne 4 ];
then
    echo "Incorrect input: try again with four numeric parameters"
else
    flag=0
    for argum in "$@" # В каждой итерации цикла в переменную argum будет записываться следующее значение из списка $@
    do
        #echo "\$@ Argument #$count = #$argum" 
        if [[ $argum =~ ^[1-6]$ ]]
        then
            :
        else
            echo "Incorrect input: ($(( $count + 1)) = $argum); try again with numbers 1 - 6"
            flag=1
        fi
        count=$(( $count + 1 )) 
    done

    if [ $flag -eq 0 ];
    then
        if [ $1 -eq $2 ]; then
            echo "Incorrect input: The first pair of numbers must be different"
            flag=1
        elif [ $3 -eq $4 ]; then
            echo "Incorrect input: The second pair of numbers must be different"
            flag=1
        elif [ $flag -eq 0 ]; then
            SYSTEMDATA=$(Sysinfo)
            echo "$SYSTEMDATA"
        fi
    fi
fi

