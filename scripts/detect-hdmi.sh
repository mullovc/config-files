hdmi_connected=$(xrandr | grep "HDMI1 connected")
hdmi_active=$(xrandr --listactivemonitors | grep "HDMI1")

if [ "$hdmi_connected" -a "$hdmi_active" ]
then
	xrandr --output HDMI1 --left-of eDP1
	xrandr --output HDMI1 --primary
	#sleep 1
	#i3-msg focus output right
	#i3-msg move workspace to output left
elif [ "$hdmi_connected" ]
then
	xrandr --output HDMI1 --auto --left-of eDP1
	sleep 1
	i3-msg move workspace to output left
	xrandr --output HDMI1 --primary
else
	xrandr --output eDP1 --primary
fi
