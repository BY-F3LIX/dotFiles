#!/bin/bash
red=ffff0000


limit=$1
if [ "$1" == "" ]; then
    limit=1
fi

icon=$2
if [ "$icon" == "" ]; then
    icon=""
fi

color=$3
if [ "$color" == "" ]; then
    color=0
fi

temp=0
for x in $(cat /sys/class/thermal/thermal_zone*/temp); do
    #echo $x "------" $y
    if [ "$temp" -lt "$x" ]; then
    temp=$x
    fi
done
temp=$( expr $temp / 1000 )
if [ "$temp" -ge "$limit" ]; then
    if [[ $color == 1 ]]; then
	echo "%{F$red}$icon$temp°C%{F- }"
    else
	echo "$icon$temp°C"
    fi
else 
    echo ""
fi
