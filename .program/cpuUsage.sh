#!/bin/bash/

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


usage=$(sar 1 3 | tail -n 1 | awk '{print $3}'t)

#echo usage : $usage

#number=${usage//,/.};
number=$(echo $usage  | grep -o -E '[0-9]+' | head -n 1 | bc -l )
#echo $number
if [ $number -ge $limit ]; then
    if [[ $color == 1 ]]; then
	echo "%{F$red}$icon$number%%{F- }"
    else
	echo $icon$number\%
    fi
else
    echo ""
fi
    
