#!/bin/bash
if pgrep -f ld-hotcorners > /dev/null; then
    pkill -f ld-hotcorners
else
    ld-hotcorners -d &
fi
