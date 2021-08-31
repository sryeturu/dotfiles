xrdb -load ~/.Xresources

monitor_count=$(xrandr | grep connected | wc -l)

if [ "$monitor_count" -eq 2 ]; then
	xrandr --output HDMI-1 --auto --left-of eDP-1
fi 

exec i3
