#!/bin/bash
START=$(date +%s.%N)

    cd $1

#1 Общее число папок, включая вложенные
    echo "Total number of folders (including all nested ones) =" `sudo ls -l -R -a  2>/dev/null | grep ^d | wc -l`

#2 Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
    echo "$(sudo du $1 -h 2>/dev/null | sort -rh | head -n 5 | awk 'BEGIN{i=1} {printf "%d - %s, %s\n", i, $2, $1; i++}')"

#3 Общее число файлов
    echo "Total number of files =" `sudo ls -laR $1 2>/dev/null | grep ^- | wc -l`
    
#4 Число конфигурационных файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
    echo "Number of:"
    echo "Configuration files (with the .conf extension) =" `sudo find $1 -type f -name "*.conf" 2>/dev/null | wc -l`
    echo "Text files = " `sudo find $1 -type f -name "*.txt" 2>/dev/null | wc -l`
    echo "Executable files = " `sudo find $1 -type f -executable 2>/dev/null | wc -l`
    echo "Log files (with the extension .log) = " `sudo find $1 -type f -name "*.log" 2>/dev/null | wc -l`
    echo "Archive files = " `sudo find $1 -type f -name "*.tar" -o -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.gz" -o -name "*.rpm" -o -name "*.cpio" 2>/dev/null | wc -l`
    echo "Symbolic links = " `sudo find $1 -type l 2>/dev/null | wc -l`

#5 Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
    #echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    #echo "$(sudo find $1 -type f -exec du -h {} + 2>/dev/null | sort -hr | head | awk '{ i = split($2, arr,"/"); printf "%s - %s, %s, %s\n", FNR, $2, $1 , arr[i] }' | awk '{ i = split($5, arr,"."); printf "%s %s %s %s %s\n", $1, $2, $3, $4, arr[i] }')"
    #echo "$(sudo find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk '{ i = split($2, arr,"."); printf "%s %s %s\n", $0, $1, arr[i] }')"
    
    array=(`sudo find $1 -type f -exec du -h {} + 2>/dev/null| sort -hr | head -10 | awk '{ i = split($2, arr,"."); printf "%s %s %s\n", $1, $2, arr[i] }'`)
    i=${#array[*]}/3
    count=0
    a=0
    b=1
    c=2
    flag=0
    while [[ $i -ne 0 ]]
    do
        count=$(( $count + 1 ))
        if [[ "${array[c]}" =~ [\/\-] ]]
        then
            array[c]=none
        else
            :
        fi
        echo "$count - ${array[b]}, ${array[a]}b, ${array[c]}"
        ((i--))
        a=$(( $a + 3 ))
        b=$(( $b + 3 ))
        c=$(( $c + 3 ))
    done

#6 Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)   
    echo "Top 10 executable files with largest size: "
    #echo "$(sudo find $1 -type f -perm /a=x -exec du -h {} + 2>/dev/null | sort -hr | head | awk '{ i = split($2, arr,"."); printf "%s.%s, %s, %s\n", FNR, $2, $1 , arr[i] }')"
    #echo "$(sudo find $1 -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{print $2}' | awk '{ i = split($0, arr,"/"); printf "%s\n", arr[i] }')"
    #echo "$(sudo find $1 -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{ i = split($2, arr,"/"); printf "%s - %s,    %s \n", FNR, $2, arr[i] }')"
    array=(`sudo find $1 -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{ printf "%s %s\n", $1, $2}'`)
    i=${#array[*]}/2
    count=0
    n=0
    m=1
    while [[ $i -ne 0 ]]
    do
        count=$(( $count + 1 ))
        echo "$count - ${array[m]}, ${array[n]}b," $(md5sum ${array[m]} | awk '{print $1}')
        ((i--))
        n=$(( $n + 2 ))
        m=$(( $m + 2 ))
    done

    
#7 Время выполнения скрипта
    END=$(date +%s.%N)
    echo "Script execution time (in seconds) = " `echo "$END $START" | awk '{printf "%.3lf", $1-$2}'`