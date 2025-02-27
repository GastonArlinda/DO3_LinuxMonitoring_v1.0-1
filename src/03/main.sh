#!/bin/bash

if [ "$#" != 4 ]; then
    echo "err, need 4 parameters"
    exit
fi

if [ "$1" = "$2" ] || [ "$3" = "$4" ]; then
    echo "parameters must not match"
    exit
fi

if [[ "$1" = [1-6] ]] && [[ "$2" = [1-6] ]] && [[ "$3" = [1-6] ]] && [[ "$4" = [1-6] ]]; then
    chmod +x info.sh
    chmod +x color.sh
    export text=$2
    export textAfter=$4
    export back=$1
    export backAfter=$3
    bash info.sh
else
    echo "parametrs must be [1-6]"
    exit
fi