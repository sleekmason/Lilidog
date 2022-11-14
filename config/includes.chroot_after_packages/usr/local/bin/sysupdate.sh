#! /bin/bash
# sysupdate.sh
# by: Domingo Urena (c) 18/02/2022
# irlxu2@gmail.com / pc_protectordr@yahoo.es
# Create a full system update for a Debian base OS
# Sintax : ./sysupdate.sh or bassh sysupdate

################################################################ Disclaimer ###
# These scripts come without warranty of any kind. Use them at your own risk. I 
# assume no liability for the accuracy, correctness, completeness, or usefulness 
# of any information provided by this script nor for any sort of damages using
# these scripts may cause.
# 
# sysupdate is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# sysupdate is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

########################################################## Inicital setings ###
nombre="System_Update"
fecha=`date`
Update_log=$nombre".md"

# If exist a previews update file, delete it
if [[ -f ~/$Update_log ]] 
  then rm ~/$Update_log
fi
# Create a new log file
touch ~/$Update_log
########################################### Definimos los Colores a utilizar ###
# BackGround with setab
bred=`tput setab 1`	# Rojo
bwht=`tput setab 7`	# Blanco
# ForeGrown with setaf
blk=`tput setaf 0`	# Negro
red=`tput setaf 1`	# Rojo
yll=`tput setaf 3`	# Amarillo
wht=`tput setaf 7`	# Blanco
# TxtFormat with setaf
bld=`tput bold`    # Select bold mode
dim=`tput dim`     # Select dim (half-bright) mode
# DefautMode with setaf
reset=`tput sgr0`
# Hide/show cursor
nshw() { tput civis    # Hide cursor
}
yshw() { tput cnorm # return cursor to normal
}
# Peppermint Color
Peppermint_Color=${bred}${bld}${wht}
Peppermint_msg=${bld}${bred}${wht}
Peppermint_good=${bld}${red}
Peppermint_note=${bld}${red}
Peppermint_err=${bld}${bred}${yll}
################################################################## Letreros ###
titulo() { # ≡ message
printf "${Peppermint_Color} %s${reset}\n" "$@"    
}
msg() { # ⓘ message
printf "${Peppermint_msg} ⓘ  ${reset}${bld}%s \n${reset}" "$@" 
}
completo() { 
if [[ "$@" == "" ]]; 
  then printf " ${Peppermint_good}[ ✔ COMPLETED ] ${reset}\n"; 
else
  printf " ${Peppermint_good}[ ✔ %s ] ${reset}\n" "$@" 
fi
}
notas() { # [ NOTES ] message
printf "${Peppermint_note} > ${reset} %s \n" "$@"    
}
advertencia() { # [ ⚠ message ]
if [ "$@" == "" ]; 
  then printf "${Peppermint_err} [ ⚠ WARNING ] ${reset}\n"
fi
printf "${Peppermint_err} [ ⚡ %s ] ${reset}\n" "$@"   
}
############################################################ Admin privilige ### 
eres_root() { # Verificación de privilegio de usuario
if [ "$(id -u)" -ne 0 ]; then sudo ls >/dev/null; fi 
}
######################################################### Updating functions ###
ACTUALIZA() { # Optiene lista de actualizaciones
sudo apt-get -y update >> ~/"$Update_log"
}
UPDATE() { # Instala las actualizaciones
sudo apt-get -y upgrade >> ~/"$Update_log"
}
LIMPIA() { # Limpia archivos innecesarios
sudo apt-get -y autoremove >> ~/"$Update_log"
}
RBRAND() { # Check PeppermintOS branding
[ -e /opt/pepconf/os-release ] && diff -q /opt/pepconf/os-release /usr/lib/os-release >> ~/"$Update_log" ||
	sudo cp /opt/pepconf/os-release /usr/lib/os-release
[ -e /opt/pepconf/os-release ] && diff -q /opt/pepconf/os-release /etc/os-release >> ~/"$Update_log" ||
	sudo cp /opt/pepconf/os-release /etc/os-release
}
############################################################ Progress Bar +  ###
rotar() { 
##  SYNTAX: rotar "COMMANDO" " Mensage de la accion " "Nombre de la tarea"
##          rotar "accion 3" "accion" "3ra accion"
  nshw # hide cursor

  # Limpia la linea de acción
  # LP="\e[2K"
   LP=$reset # reset all colors to default
  # Spinner Character
  SPINNER="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"

  spinner() { # crear subrutina
    task=$1
    mnsg=$2
    while :; do
      jobs %1 > /dev/null 2>&1
      [ $? = 0 ] || {
       # printf "${LP}✓ ${task} Done"
       completo "$task Done"
        break
      }
      for (( i=0; i<${#SPINNER}; i++ )); do
        sleep 0.05
        printf "${bld}${red}${SPINNER:$i:1}${reset} ${Peppermint_msg} ${task} ${mnsg}${reset}\r"
      done
    done
  }

  mnsg="${2-InProgress}"
  task="${3-$1}"
  $1 & spinner "$task" "$msg"

  yshw  # resturn cursor
}

############################################################## System Update ###
sysupdate() { 
#  mupdate=`sudo apt-get update -y`
  titulo "▞ ▞ ▞ ▞ ▞ ▞ ▞ ▞ Peppermint CLI Updater ▚ ▚ ▚ ▚ ▚ ▚ ▚ ▚ "
        echo
        echo "# System Update" > ~/"$Update_log"
        echo "**"$Update_log"**" $fecha >> ~/"$Update_log"
  msg " Creating list of updated programs..."  
        echo "## Creating List of updated programs" >> ~/"$Update_log"
  advertencia "... these will take some time ..." 
  rotar 'ACTUALIZA' " updated list... " "Downloading "
  msg " Installing New System Updates..."  
        echo "## Installing New System Updates..." >> ~/"$Update_log"
  advertencia "... please be patient ..."
  rotar "UPDATE" " updates... " "Installing "
  msg " ... cleaning system ..."  
        echo "## Removing stale packages..." >> ~/"$Update_log"
        echo "*... Cleaning System ...*" >> ~/"$Update_log"
  rotar "LIMPIA" " unnesesary packages... " "Cleaning "

  msg " Updating Branding files..."
        echo "## Checking PeppermintOS branding..." >> ~/"$Update_log"
  advertencia "... comparing files ..."
  rotar "RBRAND" " initializing... " "Finalizing "
        echo "[END OF FILE]" >> ~/"$Update_log"
}

mensage_final() {
#clear
titulo " ▞ ▞ ▞ ▞ System Applied Updates ▚ ▚ ▚ ▚  "
echo
echo "For more information see the update log file:"
echo "${bld}>${yll} $Update_log${reset} located in your home directory"
echo
#read -p "Press [Enter] key to exit..."                                         
read -n1 -p " Press ${bld}\"Q\"${reset} to ${bld}Q${reset}uit, or $bld\"L\"$reset to view the log file. " pause 
}                                                                      
                                                                      
view_log() {                                                          
[ "$pause" = "l" ] || [ "$pause" = "L" ] && ( clear
 echo -e "$(cat ~/${Update_log})\n\n\t Press ${bld}\"Q\"${reset} to ${bld}Q${reset}uit and close this window. " | less -R 
 clear
 ) || clear
}

clear
eres_root
sysupdate
mensage_final
view_log

