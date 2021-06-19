# Terminate already running bar instances
killall -q polybar

# killall doesn't hang, so we wait until instance is killed
while pgrep -x polybar >/dev/null; do sleep 1;done

# Launch bar
polybar bar
