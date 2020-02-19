#!/bin/bash

red=#ffff0000
path_ac="/sys/class/power_supply/AC"
path_battery_0="/sys/class/power_supply/BAT0"
path_battery_1="/sys/class/power_supply/BAT1"

hour="h"
watt="W"
discharge=0
charge=0
battery_max=0
battery_now=0

oldCharge=0

if [ -f "/home/felix/.program/CHARGE" ]; then
    oldCharge=$(cat ~/.program/CHARGE)
    #echo oldCharge: $oldCharge
fi
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
echo $charge > ~/.program/CHARGE

if [ $oldCharge -gt 0 ]; then
let x=$charge-$oldCharge
#let x=$oldCharge-$charge
#echo $x / $battery_max
#let x=$x/$battery_max
#echo $x
#let x=$x*100
let x=$x*100
y=$(printf %.2f\\n "$(( 1000000000 * $x / $battery_max ))e-9")
echo y: $y

x=$(echo "skale=3; $x/$battery_max" | bc -l)
echo $x

notify-send -t 7000 -i   "        $y%"
fi




