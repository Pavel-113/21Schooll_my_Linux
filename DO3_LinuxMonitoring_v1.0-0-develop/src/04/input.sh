#!/bin/bash

FILE=colorplan.conf

if [ -f "$FILE" ];
then
#echo "$FILE — это файл"
a="`cat "$FILE" | grep column1_background | awk -F= '{print $2}'`"
b="`cat "$FILE" | grep column1_font_color | awk -F= '{print $2}'`"
c="`cat "$FILE" | grep column2_background | awk -F= '{print $2}'`"
d="`cat "$FILE" | grep column2_font_color | awk -F= '{print $2}'`"
fi

mas=($a $b $c $d)
#echo "Array size: ${#mas[*]}"
flag=0
def=0
if [ ${#mas[*]} -ne 4 ];
then
    flag=1
fi

for item in ${mas[*]}
do
    #printf "%s\n" $item
    if [[ $item =~ ^[1-6]$ ]];
    then
        :
    else
        flag=1
    fi
done

if [ $a -eq $b ]; then
        flag=1
elif [ $c -eq $d ]; then
        flag=1
fi

if [ $flag -eq 1 ];
then
    a=5
    b=6
    c=6
    d=5
    flag=0
    def=1
fi
