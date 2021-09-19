### Lilidog Linux - 32 bit and 64 bit versions.
 
Lilidog is a lightweight distro using the Openbox window manager. <br/> 

Lilidog is based on Debian, with some of the hard parts done, and some cool stuff along the way. <br/>
Everything is easily accessible, with numerous options to customize further.

### There are currently three versions of Lilidog Available.  See below for features.

- Lilidog-amd64 (Bullseye amd64 full version) -  Has most programs already installed for everyday use. <br/>
This includes Firefox, Thunderbird, Thunar, Geany, Gpicview, Smplayer, Gparted, Synaptic, and Gimp to name a few!

- Lilidog-Minimal-amd64 - This version contains all of the goodness of Lilidog, <br/>
while allowing you to choose most all of your OWN packages. <br/>
Design your system with whatever other programs you might like! <br/> 
Currently contains Lxterminal, Pcmanfm, and Mousepad to get you easily started. <br/>
apt update && apt install synaptic for a graphical installer to make things easier. <br/>
Be prepared to edit the menu as you add packages to your distro. <br/> 
See Jgmenu.conf in the menu under "configuration" or go to ~/.config/jgmenu/README for details. <br/> 

- Lilidog-i386 (Bullseye 32 bit full version) - This version uses a 32 bit i686-pae kernel for older computers. <br/>
Click on FILES, and then RELEASES to access the 32 bit i386 version.
 
### NOTE - The DOWNLOAD button defaults to the Bullseye-amd64 full version! Click below for the others.

[![Download Lilidog](https://a.fsdn.com/con/app/sf-download-button)](https://sourceforge.net/projects/lilidog/files/latest/download)

### Click Here for the Lilidog-Minimal and the i386 release: 
https://sourceforge.net/projects/lilidog/files/Releases/

### Directions

Probably the easiest way to use Lilidog is to put it on a usb stick.

I recommend grabbing the live-usb-maker app: https://github.com/MX-Linux/lum-qt-appimage/releases/tag/19.11.02 <br/>
Download the AppImage.tar.gz and open a terminal:<br/>
```sh
tar -xaf live-usb-maker-qt-19.11.02.x86_64.AppImage.tar.gz
Then:
sudo ./live-usb-maker-qt-19.11.02.x86_64.AppImage
```
Use "image mode" in the live-usb maker when burning the image.

The boot screen for Lilidog gives a choice of using as a Live session, or installing if you like what you see. <br/>
Lilidog uses the Debian installer with both text and graphical installs available.

Lilidog opens in the Openbox window manager. Easy enough to install fluxbox or others. They will show up in your login screen
as options. <br/>
The username and password for the live environment is "user", and "live" respectively. 

Lilidog: <br/>

[![Installer.png](https://i.postimg.cc/6qSpSZNR/Installer.png)](https://postimg.cc/JHN8HG04)

[![Lilidog-Slate.png](https://i.postimg.cc/3J4CRPs6/Lilidog-Slate.png)](https://postimg.cc/SJ4z1tN7) <br/>

### Features:

- Based on Debian with contrib and non-free sources enabled by default. <br/>
Debian backport sources can be added during installation in the stable build when using the 'expert' installer. 

- These are 'no --recommends' builds. This means only the required dependancies are included during package install. <br/>
This leaves out any recommended or suggested packages, allowing for complete control over package installation. <br/>
No unwanted packages will be installed by default. This can be changed after install if desired. <br/>

- Switch between two different panels on the fly. - Customize your own to be toggled when desired.

- Tint2 panel by default, with an options for FbPanel. <br/>
Try them both under 'Toggles' in the menu.

- Jgmenu is now the menu for all versions.  Huge amount of customization available. <br/>
See the instructions section below for how to change themes and more.

- Feh sets the background. Right-click on any image to set as background wallpaper. Easy peasy! <br/>

- There are shortcuts for Alsamixer in the volume icon and xfce4-power-manager in the battery icon. <br/>
To see time format options for 24 hour vs. 12 hour, middleclick over the time for the man page. <br/>
Hover over the icons to see what they are.  The live password is "live" for the screenlock.

- Xscreensaver and other handy startup apps readily available through the toggles in the menu, <br/>
or can be activated on login by adding to the autostart cconfiguration files.

- Dmenu for an alternate menu source. - ALT + F2 pulls the full Dmenu up, while ALT + F3 pulls up a <br/>
customized Dmenu with only the most commonly used apps.

- Thunar is the default file manager in the full build, with Pcmanfm the default in the minimal build.  Custom right-click <br/> 
options for each are already added.

- Custom Lilidog Openbox and GTK themes, and matching themes for Geany and Mousepad. <br/> 
The fonts are Liberation Sans, except for urxvt and Conky, where Dejavu is used. (see "instructions" below.)

- Lxterminal by default, with URXVT terminal also installed <br/>

- URXVT terminal has font size control (ctl+up/down), transparency, and opens urls in Firefox. <br/>

- Conky has all sorts of relevant info, including connected drives, number of packages installed, and more. <br/>
For drive information, you may wish to edit the script in  ~/.config/conky/scripts. Directions included.

- Picom Composite Manager with transparency enabled. There is also a config file for compton should you choose to install it. <br/>
Look in the configuration menu to access ~/.config/picom.conf (Sid is still using Compton until updated!)

- Newsboat RSS reader with a custom configuration already in place and ready for new RSS feeds.

- Feh sets the wallpaper. More wallpapers are located in ~/Pictures/wallpapers. Right-Click in Thunar to change the wallpaper.

- System notifications enabled with Dunst. Set your own settings in ~/.config/dunst/dunstrc.

- All custom scripts are in /usr/local/bin.  Some of the fun ones are: <br/>
winfuncs tiler - For tiling and such. Set your own keybinds! <br/>
Try: __winfuncs cascade__ or __winfuncs showdesktop__  in a terminal with a couple of windows open to get the idea. <br/>
Look at the script in /usr/local/bin for the rest of the options.

- Swapid script for the frequent dual installer. This grabs your swap uuid and opens the appropriate windows to edit. <br/>
Run 'swapid' in a terminal after installing another distro to a different partition.

- ld-hotcorners - Each corner of the screen responds to a command. <br/>
Turn it on with the button in the lower left corner or under Toggles in the menu. <br/>
Change the corners in ~/.config/ld-hotcorners. <br/>
Currently clockwise from top left: __file manager, toggle Conky, exit menu, and terminal__. <br/>

### Instructions For Various Tasks:

__Theme changes:__  Lilidog comes with four custom themes! From light to dark - Lilidog-Grey, Lilidog-Clay, Lilidog-Slate, and Lilidog-Dark. <br/>
In order to change themes completely you will need to adjust 3-4 different theme settings. All theme settings <br/>
are located under "preferences" in the menu. (well, except for the Geany theme. Right-click on any image to set as background wallpaper!

- Settings Manager - This will allow changes for your gtk theme, fonts, and icons.  Other important settings are here as well. <br/>
- Openbox Conf - The settings here control the window borders and other settings specific to Openbox. <br/>
- Jgmenu - Go to menu -> configuration -> jgmenu.conf for instructions, or use __jgmenu-interactive in a terminal. (options "o" and "g"). <br/>
- Geany - There are themes to match.  These are changed through the Geany program under "view" - "change color scheme" <br/>
- Conky net speed  -  Use: __ls /sys/class/net/__ in a terminal to determine which wired/wireless network you have, <br/>
and replace "wlp2s0" with yours. <br/>
- Printer - If you have an HP printer, you should be good to go:) Setup entry in the menu under utilities.

Also look under the "Toggles" section in the menu for some instant changes to different items as well.

### Current Issues/bugs

- Xfce4-power-manager does not display the systemtray icon.  Know issue.  Waiting for update.

There is a discussion forum on Sourceforge as well if you have suggestions or questions!
https://sourceforge.net/p/lilidog/discussion/

### Instructions for building your own if you so choose:

Open a terminal and:
```sh
sudo apt install live-build live-config live-boot git
```
Be aware that neither live-boot nor live-config are necessary for the build, <br/>
but having the information is good (man pages and such), and won't hurt anything.

Now clone Lilidog to your $HOME directory:
```sh
git clone https://github.com/sleekmason/Lilidog.git
```

cd to Lilidog, and then:

```sh
sudo lb clean

Sudo lb build
```

If live build fails for some reason, simply try lb build again until it builds properly, <br/>
or if obviously won't build after a few tries, use __lb clean__ and try again. <br/>

This will leave you with an iso image you can either burn to dvd or usb (easier).

I recommend grabbing the live-usb-maker app: https://github.com/MX-Linux/lum-qt-appimage/releases/tag/19.11.02 <br/>
Download the AppImage.tar.gz and open a terminal:<br/>
```sh
tar -xaf live-usb-maker-qt-19.11.02.x86_64.AppImage.tar.gz
Then:
sudo ./live-usb-maker-qt-19.11.02.x86_64.AppImage
```

Root is required to write to connected devices.

The boot screen gives a choice of using as a Live session, or installing Lilidog Linux if you like what you see. <br/>

If you would like to work on your own distro after building, install to a separate partition ONLY to build from. <br/> 
The whole system becomes your template. Think clone within a clone.

Follow the examples here for further ideas. A whole new world just opened up if you do:) <br/>
https://live-team.pages.debian.net/live-manual/html/live-manual/examples.en.html#tutorial-1

- Please "star" this site!  This lets others know there is something worthwhile here. <br/>
- Ask questions here, or on Sourceforge. <br/>
- Feel free to link this page. This is how others also get to try new things. <br/>

Contact info: sleekmason@gmail.com

### Good Luck!

## Lilidog

[![Lili.png](https://i.postimg.cc/hjy8qYS8/Lili.png)](https://postimg.cc/5YzQBnQj)


