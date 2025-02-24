#!/bin/bash

config_file="config.conf"

default_bg1=6
default_fg1=1
default_bg2=2
default_fg2=4

if [[ -f $config_file ]]; then
    source $config_file
fi

bg1=${column1_background:-$default_bg1}
fg1=${column1_font_color:-$default_fg1}
bg2=${column2_background:-$default_bg2}
fg2=${column2_font_color:-$default_fg2}

colors=("white" "red" "green" "blue" "purple" "black")

function Start() {
    chmod +x info.sh
    chmod +x color.sh
    chmod +x config.conf
    export text=$fg1
    export textAfter=$fg2
    export back=$bg1
    export backAfter=$bg2
    bash info.sh
}

flag=1

if [[ -z $column1_background ]]; then
    column1_background="default"
    flag=0
fi

if [[ -z $column1_font_color ]]; then
    column1_font_color="default"
    flag=0
fi

if [[ -z $column2_background ]]; then
    column2_background="default"
    flag=0
fi

if [[ -z $column2_font_color ]]; then
    column2_font_color="default"
    flag=0
fi

if [ $flag -eq 1 ]; then
    if [[ ! "$column1_background" =~ ^[1-6]$ ]] || [[ ! "$column1_font_color" =~ ^[1-6]$ ]] || 
       [[ ! "$column2_background" =~ ^[1-6]$ ]] || [[ ! "$column2_font_color" =~ ^[1-6]$ ]]; then
        echo "Ошибка: Параметры должны быть числами от 1 до 6."
        exit 1
    fi

    if [[ "$column1_background" -eq "$column1_font_color" ]] || [[ "$column2_background" -eq "$column2_font_color" ]]; then
        echo "Ошибка: Цвета фона и шрифта в одном столбце не могут совпадать."
        exit 1
    fi

    Start
else
    Start
fi

if [[ "$column1_background" == "default" ]]; then
    echo "Column 1 background = default (black)"
else
    echo "Column 1 background = ${bg1} (${colors[$bg1-1]})"
fi

if [[ "$column1_font_color" == "default" ]]; then
    echo "Column 1 font color = default (white)"
else
    echo "Column 1 font color = ${fg1} (${colors[$fg1-1]})"
fi

if [[ "$column2_background" == "default" ]]; then
    echo "Column 2 background = default (red)"
else
    echo "Column 2 background = ${bg2} (${colors[$bg2-1]})"
fi

if [[ "$column2_font_color" == "default" ]]; then
    echo "Column 2 font color = default (blue)"
else
    echo "Column 2 font color = ${fg2} (${colors[$fg2-1]})"
fi