#!/bin/bash
screen=eDP1
#orientation=$(xrandr | grep $screen | cut -d' ' -f5)
#if [ "$orientation" = "$1" ]
orientation=$(xrandr | grep $screen | cut -d '(' -f 1 | grep $1)

function rot_touchscreen {
	case $1 in
		normal)
			xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
			;;
		right)
			xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
			;;
		left)
			xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
			;;
		inverted)
			xinput set-prop 'ELAN Touchscreen' 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1
			;;
	esac
}


if [ "$orientation" ]
then
	xrandr --output $screen --rotate normal
	rot_touchscreen normal
else
	xrandr --output $screen --rotate $1
	rot_touchscreen $1
fi
