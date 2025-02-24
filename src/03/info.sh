#!/bin/bash

source color.sh

echo -e "${colorback}${colortext}HOSTNAME${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$HOSTNAME${ENDCOLOR}"
echo -e "${colorback}${colortext}TIMEZONE${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(timedatectl show --property=Timezone --value) $(date +%z | cut -c 1-3)${ENDCOLOR}"
echo -e "${colorback}${colortext}USER${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$USER${ENDCOLOR}"
echo -e "${colorback}${colortext}OS${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$OSTYPE${ENDCOLOR}"
echo -e "${colorback}${colortext}DATE${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(date +%d) $(date +%b) $(date +%Y) $(date +%H:%M:%S)${ENDCOLOR}"
echo -e "${colorback}${colortext}UPTIME${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(uptime -p)${ENDCOLOR}"
echo -e "${colorback}${colortext}UPTIME_SEC${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(awk '{print $1}' /proc/uptime)${ENDCOLOR}"
echo -e "${colorback}${colortext}IP${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(hostname -I | awk '{print $1}')${ENDCOLOR}"
echo -e "${colorback}${colortext}MASK${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(ip addr show | grep -E 'inet ' | awk '{print $2}' | sed 's#/.*##' | head -n 1)${ENDCOLOR}"
echo -e "${colorback}${colortext}GATEWAY${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(ip route | grep default | awk '{print $3}')${ENDCOLOR}"
echo -e "${colorback}${colortext}RAM_TOTAL${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(free | grep Mem | awk '{kbyte =$2 /1024/1024; printf("%.3f GB", kbyte)}')${ENDCOLOR}"
echo -e "${colorback}${colortext}RAM_USED${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(free | grep Mem | awk '{kbyte =$3 /1024/1024; printf("%.3f GB", kbyte)}')${ENDCOLOR}"
echo -e "${colorback}${colortext}RAM_FREE${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(free | grep Mem | awk '{kbyte =$4 /1024/1024; printf("%.3f GB", kbyte)}')${ENDCOLOR}"
echo -e "${colorback}${colortext}SPACE_ROOT${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(df -h /root | grep "/dev/" | awk '{mb=$2*1024; printf("%.2f MB", mb)}')${ENDCOLOR}"
echo -e "${colorback}${colortext}SPACE_ROOT_USED${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(df -h /root | grep "/dev/" | awk '{mb=$3*1024; printf("%.2f MB", mb)}')${ENDCOLOR}"
echo -e "${colorback}${colortext}SPACE_ROOT_FREE${ENDCOLOR} = ${colorbackAfter}${colortextAfter}$(df -h /root | grep "/dev/" | awk '{mb=$4*1024; printf("%.2f MB", mb)}')${ENDCOLOR}"
