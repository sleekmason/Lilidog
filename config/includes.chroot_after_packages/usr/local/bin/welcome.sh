#!/bin/bash
# Welcome script for Lilidog made by sleekmason 2-24-22

full_fs=$(df ~ | tail -1 | awk '{print $1;}')  # find partition
fs=$(basename "$full_fs")
if grep -q "$fs" /proc/partitions; then
  yad --title "Welcome!" --window-icon=/usr/share/icons/ld-icons/paw-color.png \
--width=488 --height=444 --center --escape-ok --undecorated --skip-taskbar \
--button=" Begin"!/usr/share/icons/gnome/22x22/places/debian-swirl.png!:"xfce4-terminal --geometry=68x20-80-80 -T 'Customization' -e 'sudo ld-entry -i'" \
--button="gtk-ok:0" \
--text-info --justify=left --wrap < /usr/share/lilidog/welcome.txt --fontname="JetBrains Mono Light 11" \
--fore="#DBDBDB"; sed -i '/welcome.sh &/d' ~/.config/openbox/autostart && exit
else
  yad --title "Welcome!" --window-icon=/usr/share/icons/ld-icons/paw-color.png \
--width=488 --height=340 --center --escape-ok --undecorated --skip-taskbar \
--button="gtk-ok:0" \
--text-info --justify=left --wrap < /usr/share/lilidog/welcome2.txt --fontname="JetBrains Mono Light 11" \
--fore="#DBDBDB"; sed -i '/welcome.sh &/d' ~/.config/openbox/autostart
fi
