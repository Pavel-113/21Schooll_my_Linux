#!/bin/bash

if [ $# != 1 ];
then
    echo "Incorrect input: try again with one pareametr: ./main.sh <param1>"
else
    if ! [ -d $1 ]; then
        echo 'Incorrect input: try again with /<directory name>/'
    else
        ./data.sh $1
    fi
fi