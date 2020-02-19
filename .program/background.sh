#!/bin/bash
#feh --bg-fill  --no-xinerama ~/Dropbox/Bilder/wallpaper/nice/wallpaper.jpg
#betterlockscreen -u ~/Dropbox/Bilder/wallpaper/nice/wallpaper.jpg
#feh --bg-fill  --no-xinerama ~/Dropbox/Bilder/wallpaper/nice/wallpaper\.*
feh --no-fehbg --bg-fill --randomize -r ~/Dropbox/Bilder/wallpaper/nice
betterlockscreen -u $(cat ~/.program/lockscreen.temp)
