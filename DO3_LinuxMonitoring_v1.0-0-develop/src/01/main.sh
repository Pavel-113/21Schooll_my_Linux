#!/bin/bash

if [ $# -eq 1 ];
then
    if [[ $1 =~ ^-?([0-9])+(\.?)+([0-9]?)+$ ]]
    then
        echo "Message: invalid input, [$1] not a text parameter."
    else
        echo $1
    fi
else
    echo "Message: invalid input, enter a one text parameter"
fi