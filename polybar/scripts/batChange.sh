#!/bin/sh
if [ -f ~/.config/polybar/scripts/stat ]; then
    temp=$(cat ~/.config/polybar/scripts/stat)
    temp=$(($temp + 1))
    echo "$temp" > stat

else
    echo 1 > stat
fi
