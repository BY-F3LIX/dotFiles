#!/bin/bash 

limit=$1
if [ "$limit" == "" ]; then
    limit=6
fi

icon=$2
if [ "$icon" == "" ]; then
    icon=""
fi

red=#ffff0000
color=$3
if [ "$color" == "" ]; then
    color=0
fi


path_ac="/sys/class/power_supply/AC"
path_battery_0="/sys/class/power_supply/BAT0"
path_battery_1="/sys/class/power_supply/BAT1"

hour="h"
watt="W"
discharge=0
 charge=0
 battery_max=0
 battery_now=0
 acOnline=$(cat $path_ac/online)
 if [ -f "$path_battery_0/power_now" ]; then
     discharge=$(cat "$path_battery_0/power_now")
     charge=$(cat "$path_battery_0/energy_now")
     per_0=$(python -c "print ($(cat "$path_battery_0/energy_now")*100) / $(cat "$path_battery_0/energy_full")")
     battery_max=$(cat "$path_battery_0/energy_full")
     battery_now=$(cat "$path_battery_0/energy_now")
 fi
 if [ -f "$path_battery_1/power_now" ]; then
     discharge=$(($discharge + $(cat "$path_battery_1/power_now")))
     charge=$(($charge + $(cat "$path_battery_1/energy_now")))
     per_1=$(python -c "print ($(cat "$path_battery_1/energy_now")*100) / $(cat "$path_battery_1/energy_full")")
     battery_max=$(($battery_max + $(cat "$path_battery_1/energy_full")))
     battery_now=$(($battery_now + $(cat "$path_battery_1/energy_now")))
 fi
 dischargeRate=$(python -c "print $discharge / 1000000.0")
 
 v=$dischargeRate
 #echo $dischargeRate
 
dischargeRate=${v%%.*}

if [ $acOnline -eq 0 ]; then

if [ $dischargeRate -ge $limit ]; then
    output=$(echo "scale=2; $v/1" | bc -l )
    if [[ $color == 1 ]]; then
	echo "%{F$red}$icon$(echo $output)W%{F-}" 	

    else
	echo $icon$(echo $output)W
    fi
else
    echo ""
fi
else 
    echo ""
fi
