#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: Не указан путь до директории."
    exit 1
fi

dir=$1
len=${#dir}
r=$((len-1))
lSymb=${dir: r}

if [ ! -d "$dir" ]; then
    echo "Ошибка: Указанная директория не существует."
    exit 1
fi

if [ "$lSymb" == "/" ]; then
    START=$(date +%s)
    chmod +x info.sh
    . ./info.sh
    END=$(date +%s)
    diff=$((END - START))
    echo "Script execution time (in seconds) = $diff"
else
    echo "Ошибка: Отсутствует симлов '/' в конце пути"
fi