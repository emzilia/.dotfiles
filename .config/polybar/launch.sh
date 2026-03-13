#!/bin/bash

killall -q polybar


while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar left &
polybar center &
polybar playerctl &
polybar right &
polybar left2 &
polybar center2 &
polybar playerctl2 &
polybar right2 &

echo "Polybar launched..."
