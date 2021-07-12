#!/bin/bash

killall -q polybar

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload desktop-bottom &
		MONITOR=$m polybar --reload desktop-top &
	done
else
	polybar --reload desktop-bottom &
	polybar --reload desktop-top &
fi

