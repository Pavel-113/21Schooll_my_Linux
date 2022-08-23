#!/bin/bash
cd `dirname $0`
PATH_TO_SCRIPT=`pwd`
DATE_NAME=$(date +%D | awk -F / '{print $2$1$3}')

function name_generator {
    local NAME=
    local ALPHABET=
    local ALPHABET=$1
    local LENGTH_ALPHABET=
    local LENGTH_ALPHABET=`expr length $ALPHABET 2> /dev/null`
    for (( i=1; i<=$LENGTH_ALPHABET; i++ ))
    do
        local arr[$i]=
        local arr[$i]=`expr substr $ALPHABET $i 1 2> /dev/null`
        local NAME+="${arr[$i]}"
    done
    echo $NAME
}

function add_Sign {
    local NAME= 
    local NAME=$1
    local ALPHABET=
    local ALPHABET=$2
    local SYMBOL=
    local SYMBOL=$3
    local LENGTH_ALPHABET=`expr length $ALPHABET 2> /dev/null`
    for (( i=1; i<=$LENGTH_ALPHABET; i++ ))
    do
        local arr[$i]=
        local arr[$i]=`expr substr $ALPHABET $i 1 2> /dev/null`
    done
    local INDEX_SIGN=`expr index $NAME ${arr[$SYMBOL]} 2> /dev/null`
    local TMP_NAME=
    local TMP_NAME=$(expr substr $NAME 1 $INDEX_SIGN 2> /dev/null)${arr[$SYMBOL]}$(echo ${NAME:$INDEX_SIGN})
    local NAME=$TMP_NAME
    echo $NAME
}

touch $PATH_TO_SCRIPT/logs_file.txt
echo -n "" > $PATH_TO_SCRIPT/logs_file.txt


for ((j=0; j<$COUNT_DIR; j++))
do
    cd $ABS_PATH
    FREE_SPACE_MB=$(df / |  head -2 | tail +2 | awk '{printf("%d", $4)}')
    if [[ $FREE_SPACE_MB -le 1048576 ]]
    then
        break
    else
        :
    fi

    #CREATE FOLDER
    NAME_DIR=$(name_generator $ALPHABET_DIR)
    TMP_NAME_DIR=$NAME_DIR"_"$DATE_NAME
    CHAR=0
    while [ -d "$TMP_NAME_DIR" ] || [[ `expr length $NAME_DIR` -lt 4 ]];
    do
        if [[ CHAR -ge `expr length $ALPHABET_DIR` ]] || [[ `expr length $ALPHABET_DIR` -eq 1 ]]
        then
            CHAR=1
        else
            CHAR=$(($CHAR+1))
        fi
        NAME_DIR=$(add_Sign $NAME_DIR $ALPHABET_DIR $CHAR)
        TMP_NAME_DIR=$NAME_DIR"_$DATE_NAME"
    done
    mkdir $TMP_NAME_DIR
    echo $(pwd)"/$TMP_NAME_DIR/" `date +%Y-%m-%d-%H-%M` >> $PATH_TO_SCRIPT/logs_file.txt

    #CREATE FILES
    for ((f=0;f<$COUNT_FILES; f++))
    do
        CHAR_FILE=0
        NAME_FILE=$(name_generator $ALPHABET_NAME_FILE)
        FILE=$TMP_NAME_DIR"/$NAME_FILE.$ALPHABET_EXT_FILE"
        while [ -f $FILE ] || [[ `expr length $NAME_FILE` -lt 4 ]];
        do
            if [[ CHAR_FILE -ge `expr length $ALPHABET_DIR` ]] || [[ `expr length $ALPHABET_NAME_FILE` -eq 1 ]]
            then
                CHAR_FILE=1
            else
                CHAR_FILE=$(($CHAR_FILE+1))
            fi
            NAME_FILE=$(add_Sign $NAME_FILE $ALPHABET_NAME_FILE $CHAR_FILE)
            FILE=$TMP_NAME_DIR"/$NAME_FILE.$ALPHABET_EXT_FILE"
        done
        touch $FILE
        fallocate -l $SIZE_FILE"KB" $FILE 2> /dev/null
        echo $(pwd)"/$FILE" `date +%Y-%m-%d-%H-%M` `ls -lh $FILE 2> /dev/null | awk '{print $5}'` >>  $PATH_TO_SCRIPT/logs_file.txt
        FREE_SPACE_MB=$(df / |  head -2 | tail +2 | awk '{printf("%d", $4)}')
        if [[ $FREE_SPACE_MB -le 1048576 ]]
        then
            exit 1
        fi
    done
done
