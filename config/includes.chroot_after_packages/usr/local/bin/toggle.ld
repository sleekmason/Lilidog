#!/bin/bash
if pgrep -f ld-hotcorners > /dev/null; then
    pkill -f ld-hotcorners
    notify-send "Hotcorners Off"
else
    ld-hotcorners -d &
    notify-send "Hotcorners On"
fi
