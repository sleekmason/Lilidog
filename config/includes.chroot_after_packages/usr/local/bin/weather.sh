#!/bin/bash
#Script para abrir uma janela pequena do Rox-term, com o estado e 
#previsão do tempo, na localização precisa, na  língua do sistema

geoip="$(wget -O- -q http://geoip.ubuntu.com/lookup)" ;
area="$(sed -r 's/.*<RegionName>(.*?)<\/RegionName>.*/\1/g' <<< "$geoip")";
corrected_area=$(echo "${area// /_}");
langu=$(locale | grep LANG | cut -d= -f2 | cut -d. -f1);
l1=$(echo "$langu" |cut -d_ -f1);
WINID=$(wmctrl -lx | grep 'Wtrr.in' | awk 'NR==1{print $1}');
if [ "$WINID" ]; then  wmctrl -ia "$WINID" &
else x-terminal-emulator -hide-menubar -title "Weather Report" \
-geometry 125x40 -e bash -c \
"curl 'http://wttr.in/$corrected_area?lang=$l1'; read -N1;" & fi

#WINID=$(wmctrl -lx | grep 'Wtrr.in' | awk 'NR==1{print $1}');
#if [ $WINID ]; then  wmctrl -ia $WINID &
#else roxterm --hide-menubar --title "Wtrr.in" --zoom=0,85 \
#--geometry 130x40 -e bash -c "curl 'http://wttr.in/'; read -N1;" & fi
