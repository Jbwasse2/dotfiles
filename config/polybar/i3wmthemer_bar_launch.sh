#!/bin/env sh


pkill polybar

#Wait for pkill to go through
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done 
#if type "xrandr"; then
#    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#        MONITOR=$m polybar --reload top &
#    done
#else
  polybar --reload top &
#fi

#polybar top &
#polybar bottom;
