### Lilidog Linux
 
Lilidog is a lightweight Linux distro using the Openbox window manager. <br/> 

Lilidog is based on Debian, with most of the hard parts done, and some cool stuff along the way. <br/>
Everything is easily accessible, with numerous options to customize further.

### There are currently three versions of Lilidog available.

- Lilidog-amd64 (Bullseye amd64 full version) -  Has most programs already installed for everyday use. <br/>
This includes Firefox, Thunderbird, Thunar, Geany, Gpicview, Smplayer, Gparted, Synaptic, and Gimp to name a few.

- Lilidog-Minimal-amd64 - This version contains all of the goodness of Lilidog <br/>
while allowing you to choose most all of your OWN packages. <br/> 
Currently contains xfce4-terminal, Thunar, and Mousepad to get you started. <br/>
Design your system with any other programs you might like. <br/>
__sudo apt update && sudo apt install synaptic__ for a graphical interface to make installing your programs easier. <br/>

- Lilidog-Sid-amd64 This version uses the repositories from the unstable branch (sid).  If you want a rolling release, <br/>
this is the one for you. You will want to __sudo apt update && sudo apt upgrade__ frequently to not fall too far behind.

See further below for features.

### NOTE - The DOWNLOAD button defaults to the Bullseye-amd64 full version! (stable).  Click below for the others.

[![Download Lilidog](https://a.fsdn.com/con/app/sf-download-button)](https://sourceforge.net/projects/lilidog/files/latest/download)

### Click Here for the other releases: 
https://sourceforge.net/projects/lilidog/files/Releases/

### Directions

Probably the easiest way to use Lilidog is to put it on a usb stick.

One easy way is to grab the live-usb-maker app: https://github.com/MX-Linux/lum-qt-appimage/releases/tag/19.11.02 <br/>
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

- Tint2 panel by default, with an options for FbPanel. Try them both under 'Toggles' in the menu.

- Jgmenu is the menu for all versions.  Huge amount of customization available. <br/>
Go to menu -> configuration -> jgmenu.conf for how to change items. For themes, go to Jgmenu Theme Changer and use "o" or "g".

- Wallpapers - Handled by Feh.  Place any image you would like to use as a wallpaper in ~/Pictures/wallpapers. <br/>
Go to Menu -> Configuration -> Wallpaper Chooser to change wallpapers. <br/>
You can also right-click on any image you choose from the file manager to set as background wallpaper. Other right-click <br/>
options for images include rotation and copying to ~/Pictures.wallpapers. A random wallpaper toggle is included.

- Grub background changer opens a window to choose your own images.

- There are shortcuts for xfce4-power-manager in the battery icon. <br/>
To see time format options for 24 hour vs. 12 hour, middleclick over the time for the man page. <br/>
Hover over the icons to see what they are.  The live password is "live" for the screenlock.

- Xscreensaver and other handy startup apps readily available through the toggles in the menu, <br/>
or can be activated on login by adding to the autostart cconfiguration file.

- Dmenu for an alternate menu source. - ALT + F2 pulls the full Dmenu up, while ALT + F3 pulls up a <br/>
customized Dmenu with only the most commonly used apps.

- Wbar for icons on the desktop if desired. activate from Toggles in the menu. Fun to configure!

- Thunar is the default file manager.  Custom right-click options are already added as well.

- Custom Lilidog Openbox and GTK themes, and matching themes for Geany and Mousepad. <br/> 
The fonts are Liberation Sans, except for urxvt and Conky, where Dejavu is used. (see "instructions" below.)

- Xfce4-terminal is default, with URXVT also installed. Use "App Alternatives in the menu <br/>
 or __sudo update-alternatives --config x-terminal-emulator__ in a terminal to switch default terminals.  

- URXVT terminal has font size control (ctl+up/down), transparency, and opens urls in Firefox. <br/>

- Conky Chooser in toggles allows for toggling different conky's, and has all sorts of relevant info, <br/>
including connected drives, number of packages installed, and more. 

- Picom Composite Manager with transparency enabled. Look in the configuration menu to access ~/.config/picom.conf.

- Gammy screen color and lightness control located in Toggles, and from the keyboard.

- Newsboat RSS reader with a custom configuration already in place and ready for new RSS feeds.

- System notifications enabled with Dunst.

- Menu Extras - Install menu with options for Liquorix kernel, Qemu, Virtualbox (sid), Steam, Etcher, and more.

- All custom scripts are in /usr/local/bin.  Some of the fun ones are: <br/>
winfuncs tiler - For tiling and such. Set your own keybinds! <br/>
Try: __winfuncs cascade__ or __winfuncs showdesktop__  in a terminal with a couple of windows open to get the idea. <br/>
Look at the script in /usr/local/bin for the rest of the options.

- Swapid script for the frequent dual installer. This grabs your swap uuid and opens the appropriate windows to edit. <br/>
Run 'swapid' in a terminal after installing another distro to a different partition.

- ld-hotcorners - Each corner of the screen responds to a command. <br/>
Turn it on with the button in the lower left corner or under Toggles in the menu. <br/>
Change the corners in ~/.config/ld-hotcorners. <br/>
Currently clockwise from top left: __file manager, toggle Picom, exit menu, and terminal__. <br/>

### Instructions For Various Tasks:

__Theme changes:__  
The easiest way to change themes is with the 'Quick Theme Changer' located in the menu under Configuration. <br/>
This changes The GTK theme, Openbox theme, Geany theme, Lightdm, wallpaper, menu, and terminal theme all on the fly. <br/>

__Make your own themes:__ <br/>
All of the theme files are located in ~/.config/lilidog-themes. This will allow you to change the settings on the existing themes,
to making your own and adding a button to the theme changer. For a quick overview see the discussion: https://sourceforge.net/p/lilidog/discussion/setup/thread/b3fec6a23b/ <br/>
or the README located in ~/.config/lilidog-themes. <br/>

__Other Settings:__
- For keyboard language layout see: https://sourceforge.net/p/lilidog/discussion/setup/thread/e9e88533c0/<br/>
- Most common items to change will have an entry under 'Configuration' in the menu.<br/>
- Settings Manager - Change your gtk theme, fonts, and icons on an individual basis.  Other important settings are here as well. <br/>
- Openbox Conf - The settings here control the window borders and other settings specific to Openbox. <br/>
- Jgmenu - Go to menu -> configuration -> jgmenu.conf for menu items. For theme changes, got to Jgmenu Theme Changer in the menu. ("o" or "g") <br/>
- Geany - There are themes to match.  These are changed through the Geany program under "view" - "change color scheme" <br/>
- Conky net speed (when uncommented) -  Use: __ls /sys/class/net/__ in a terminal to determine which wired/wireless network you have, <br/>
and replace "wlp2s0" with yours. <br/>
- Printer - Setup entry in the menu under utilities. <br/>
- Lightdm - Configuration settings in the menu. <br/>

Also look under the "Toggles" section in the menu for some instant changes to different items as well.

There is a discussion forum above on Sourceforge as well if you have suggestions or questions.
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


