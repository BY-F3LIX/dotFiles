#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload example -r &
#  done
#else
#  polybar --reload example -r &
#fi

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar top &
#polybar bottom &
#polybar top -r &
polybar example -r &
#polybar bottom -r &
echo "Bars launched..."
