#!/bin/bash
bat_path=/sys/class/power_supply/BAT0
capacity_now=$(cat $bat_path/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d '=' -f 2)
low=25
if [ $capacity_now -le $low ]
then
	notify-send "low battery charge" --icon=battery-caution
fi
