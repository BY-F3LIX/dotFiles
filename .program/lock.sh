#!/bin/bash

bash ~/.program/disCharge.sh
playerctl pause
#I inserted my standart wallpaper
#~/.local/bin/flash_window
#
##polybar-msg cmd hide
#scrot temp.png
#rm ~/.cache/i3lock/current/dim.png;
#convert temp.png -blur 0x64 ~/.cache/i3lock/current/dim.png
#rm temp.png; cp ~/.cache/i3lock/current/dim.png ~/.cache/i3lock/current/l_dim.png
#betterlockscreen -l dim -t
xcalib -clear
betterlockscreen -s blur -t
sudo libinput-gestures -r

sleep 2
bash ~/.program/restartLibinput;
bash ~/.program/disCharge.sh
rm ~/.program/CHARGE
dbus-send --system --type=method_call  --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" "org.freedesktop.UPower.KbdBacklight.SetBrightness" int32:1
