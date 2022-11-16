#!/bin/bash
# Welcome script for Lilidog made by sleekmason 2-24-22

full_fs=$(df ~ | tail -1 | awk '{print $1;}')  # find partition
fs=$(basename "$full_fs")
if grep -q "$fs" /proc/partitions; then
   sed -i '/welcome.sh &/d' ~/.config/openbox/autostart && exit
else
  yad --title "Welcome!" --window-icon=/usr/share/icons/ld-icons/paw-color.png \
--width=488 --height=340 --center --escape-ok --undecorated \
--skip-taskbar  --button="gtk-ok:0" \
--text-info --justify=left --wrap < /usr/share/lilidog/welcome.txt --fontname="JetBrains Mono Light 11" \
--fore="#99C5F7"; sed -i '/welcome.sh &/d' ~/.config/openbox/autostart
fi
