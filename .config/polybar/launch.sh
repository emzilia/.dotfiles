#!/bin/bash

killall -q polybar


while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar example &
polybar example2 &

echo "Polybar launched..."