#!/bin/bash

red=ffff0000

limit=$1
if [ "$1" == "" ]; then
    limit=1
fi

icon=$2
if [ "$icon" == "" ]; then
    icon=""
fi

color=$3
if [ "$color" == "" ]; then
    color=0
fi

total=$(cat /proc/meminfo | grep MemTotal | grep -o -E "[0-9]*")
available=$(cat /proc/meminfo | grep Available | grep -o -E "[0-9]*")
free=$(cat /proc/meminfo | grep MemFree | grep -o -E "[0-9]*")

usage=$(printf %.2f\\n "$(( 10000*($total-$available)/$total))e-2")
number=$(printf "$(( 100*($total-$available)/$total))")


if [ $number -ge $limit ]; then
    if [[ $color == 1 ]]; then
        echo "%{F$red}$icon$usage%%{F- }"
    else
        echo $icon$usage\%
    fi
else
    echo ""
fi

