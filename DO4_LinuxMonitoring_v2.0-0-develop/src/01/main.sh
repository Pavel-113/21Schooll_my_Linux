#!/bin/bash
cd $(dirname $0)

# Параметр 1 - ABS_PATH - это абсолютный путь.
# Параметр 2 - COUNT_DIR - количество вложенных папок. 
# Параметр 3 - ALPHABET_DIR - список букв английского алфавита, используемый в названии папок (не более 7 знаков). 
# Параметр 4 - COUNT_FILES - количество файлов в каждой созданной папке. 
# Параметр 5 - ALPHABET_FILE - список букв английского алфавита, используемый в имени файла и расширении (не более 7 знаков для имени, не более 3 знаков для расширения). 
# Параметр 6 - SIZE_FILE - размер файлов (в килобайтах, но не более 100).

if [ $# -ne 6 ]     # Проверка на количесво параметров.
then
    echo Enter six parameters. Example: main.sh /opt/test 4 az 5 az.az 3kb.
    exit 1
fi

declare -x ABS_PATH=$1
if [[ ! ( -d $ABS_PATH) ]]   # Проверка сущесвтвоавния директории
then
    echo Error: Parameter 1 - No such directory: $ABS_PATH
    exit 1
fi
if [[ !($ABS_PATH =~ ^\/.*) ]]    # Проверка абсолютности пути
then
    echo -e Error: Parameter 1 - The path must be absolute: $ABS_PATH
    exit 1
fi
declare -x COUNT_DIR=$2
if [[ !($COUNT_DIR =~ ^([0-9]+)$) ]]    # Проверка количесва директорий
then
    echo Error: Parameter 2 - The number of subfolders must be a NUMBER: $COUNT_DIR
    exit 1
fi
declare -x ALPHABET_DIR=$3
if [[ $(echo $ALPHABET_DIR | wc -c) -gt 8 ]]       # Проверка количесва символов
then
    echo "Error: Parameter 3 - The list of letters of the English alphabet used in folder names (no more than 7 characters): $ALPHABET_DIR"
    exit 1
else
    if [[ !($ALPHABET_DIR =~ ^([a-zA-Z]+)$) ]]     # Проверка символов (только английский алфавит)
    then
        echo "Error: Parameter 3 - The list of letters of the English alphabet used in folder names: $ALPHABET_DIR"
        exit 1
    fi
fi
declare -x COUNT_FILES=$4
if [[ !($COUNT_FILES =~ ^([0-9]+)$) ]]       # Проверка на число
then
    echo Error: Parameter 4 - The number of files must be a NUMBER: $COUNT_FILES
    exit 1
fi
if [[ !($5 =~ ^[a-zA-Z]+\.[a-zA-Z]+$ ) ]]       # Проверка на имени и расширения файла
then
    echo "Error: Parameter 5 - The list of English alphabet letters used in file name and extension (no more than 7 characters before the dot - for the name, no more 3 characters after dot - for the extension): $5"
    exit 1
else
    declare -x ALPHABET_NAME_FILE=$(echo $5 | cut -d. -f 1)
    if [[ $(echo $ALPHABET_NAME_FILE | wc -c) -gt 8 ]]
    then
        echo "Error: No more than seven characters before period"
        exit 1
    else
        declare -x ALPHABET_EXT_FILE=$(echo $5 | cut -d. -f 2)
        if [[ $(echo $ALPHABET_EXT_FILE | wc -c) -gt 4 ]]
        then
            echo "Error: No more than three characters after the dot"
            exit 1
        fi
    fi
fi
if [[ !($6 =~ ^[0-9]+(kb)$) ]]       # Проверка размера файла
then
    echo "Error: Parametr 6 - File size must be in kilobates (for example: 14kb): $6"
else
    declare -x SIZE_FILE=$(echo $6 | sed 's/kb//')
    if [ $SIZE_FILE -gt 100 ]
    then
        echo "Error: Parametr 6 - File size must be in kilobates (but not more 100kb): $SIZE_FILE"
    else
        chmod +x executor.sh
        ./executor.sh
    fi
fi

# echo ABS_PATH $ABS_PATH
# echo COUNT_DIR $COUNT_DIR
# echo ALPHABET_DIR $ALPHABET_DIR
# echo COUNT_FILES $COUNT_FILES
# echo ALPHABET_NAME_FILE $ALPHABET_NAME_FILE
# echo ALPHABET_EXT_FILE $ALPHABET_EXT_FILE
# echo SIZE_FILE $SIZE_FILE


