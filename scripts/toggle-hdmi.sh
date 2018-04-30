hdmi_on=$(xrandr --listactivemonitors | grep "HDMI1")

if [ "$hdmi_on" ]
then
	xrandr --output HDMI1 --off
	xrandr --output eDP1 --primary
else
	xrandr --output HDMI1 --auto --left-of eDP1
	sleep 1
	i3-msg move workspace to output left
	xrandr --output HDMI1 --primary
fi
