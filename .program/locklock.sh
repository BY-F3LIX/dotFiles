#!/bin/bash
timeout=360
notify=30
#rm ~/.cache/i3lock/current/dim.png;
#convert ~/Dropbox/Bilder/wallpaper/nice/wallpaper.jpg -blur 0x48 ~/.cache/i3lock/current/dim.png
#cp ~/.cache/i3lock/current/dim.png ~/.cache/i3lock/current/l_dim.png

#for a in $(pidof xss-lock); do kill $a; done
#pkill xss-lock
bash ~/.program/killthis xss-lock
#sleep 2;
echo locked
#xss-lock -- bash ~/.program/lock.sh
xset s $((timeout - notify)) $notify
notify-send "lock active"
xss-lock -l --notifier="xcalib -co 30 -a" -- bash ~/.program/lock.sh &
