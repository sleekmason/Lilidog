#!/bin/bash
if pgrep -f ld-hotcorners > /dev/null; then
    pkill -f ld-hotcorners
    notify-send --urgency low "Hotcorners Off"
else
    ld-hotcorners -d &
    notify-send --urgency low "Hotcorners On"
fi
