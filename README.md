﻿# Lilidog Linux Based on Debian stable
## LXDE With Openbox, Fluxbox, Jwm, and Pekwm.  Optimized - 64 bit version.<br/>

Lilidog is a dark themed distro based on LXDE. <br/> 
Options are available for Openbox, Fluxbox, Jwm, or Pekwm. <br/> 
Toggle freely between the four while in the default session. <br/>
All Window managers can be accessed separately through the login screen, but no toggling in this case.

Pretty much, Debian. With some of the hard parts done, and some cool stuff along the way. <br/>
Everything is easily accessible, with numerous options to customize.

This is the stable version. You can download the full ISO from Sourceforge:

[![Download Lilidog](https://a.fsdn.com/con/app/sf-download-button)](https://sourceforge.net/projects/lilidog/files/latest/download)


### Other Versions on Github:

For the minimal build: https://github.com/sleekmason/Lilidog-Minimal

For the Unstable build: https://github.com/sleekmason/Lilidog-w-custom-kernel


### Openbox
[![Openbox-gradient-2-7-21.png](https://i.postimg.cc/qBKYdxQN/Openbox-gradient-2-7-21.png)](https://postimg.cc/Wt2SGrBV)

### Fluxbox
[![Fluxbox-1-26-21.png](https://i.postimg.cc/x1kyjPvP/Fluxbox-1-26-21.png)](https://postimg.cc/hXB7pT3J)

### Jwm
[![Jwm-2-7-21.png](https://i.postimg.cc/8CJ0ZR0B/Jwm-2-7-21.png)](https://postimg.cc/f3sCL9ZJ)

### Pekwm
[![Pekwm-1-26-21.png](https://i.postimg.cc/JnQjYY8R/Pekwm-1-26-21.png)](https://postimg.cc/zbVLVj3Q)

### Features:

- Based on Debian Buster with contrib and non-free sources enabled by default. <br/>
Debian backport sources can be added during installation. 

- Switch between all four window managers freely while in session through the toggles in the menu. <br/> 

- Switch between four different panels on the fly as well. - Customize your own to be toggled when desired.

The username and password for the live environment is "user", and "live" respectively. <br/>

- Hybrid Monster panel by default in Openbox, with options for FbPanel, Lxpanel, or Tint2 panel. <br/>
Monster panel is a combination of the pager and icon control from Fbpanel, with everything else Tint2. <br/>
Try Fbpanel or Tint2 in the live environment under 'Toggles' in the menu.

- There are shortcuts for Alsamixer in the volume icon and xfce4-power-manager in the battery icon. <br/>
To see time format options for 24 hour vs. 12 hour, middleclick over the time for the man page. <br/>
Hover over the icons to see what they are.  The live password is "live" for the screenlock.

- X-screensaver and other handy startup apps readily available through the toggles in the menu, <br/>
or can be activated on login by navigating to Lxsession Autostart in the menu, and enabling.

- Dmenu and Rofi for alternate menu sources. - ALT + F2 pulls the full Dmenu up, while ALT + F3 pulls up a <br/>
customized Dmenu with only the most commonly used apps. ALT + F5 pulls up Rofi.

- Thunar is the default file manager, with Pcmanfm and Spacefm as alternatives to explore.  Custom right-click <br/> 
options for each are already enabled.  See what you like best.

- Custom Lilidog Openbox and GTK theme, Gnome Brave Icons, and matching themes for Geany and Mousepad. <br/> 
The fonts are Liberation Sans, except for urxvt and Conky, where Dejavu is used.

- URXVT terminal has font size control (ctl+up/down), transparency and the ability to open urls. <br/>
Lxterminal is readily available in the menu and launcher for those who prefer it.

- Conky has all sorts of relevant info, including connected drives, number of packages installed, and more. <br/>
For drive information, you may wish to edit the script in  ~/.config/conky/scripts. Directions included.

- Desktop icons can be enabled and customized using pcmanfm. See lxsession autostart in the menu. <br/>

- Compton Composite Manager with transparency enabled. Change to suit.

- Newsboat RSS reader with a custom configuration already in place and ready for new RSS feeds.

- BFQ IO Scheduler by Default for spinning drives. "Mq-Deadline" for SSD and eMMC, and "None" for nvme. <br/>
To change this to kernel default, delete 60-scheduler.rules in /etc/udev/rules.d

- Feh sets the wallpaper directly in lxsession autostart rather than pointing to ~/.fehbg <br/>
After installation, you may want to change this to ~/.fehbg & in lxsession autostart for customization. <br/>

If you would prefer to use icons on the desktop, enable __pcmanfm --desktop --profile__ in Lxsession autostart.

- My wife painted rocks for the wallpaper and I found I like them quite a bit:) Maybe you will too.<br/> 
Feel free to use them however you like, or delete them and point to something else. No worries:) <br/> 
They are mine/yours, not off the internet. 

- System notifications enabled with Dunst. Set your own settings in ~/.config/dunst/dunstrc.

- All scripts are in /usr/local/bin.  Some of the fun ones are: <br/>
- winfuncs tiler - For tiling and such. Set your own keybinds! <br/>
Try: __winfuncs cascade__ or __winfuncs showdesktop__  in a terminal with a couple of windows open to get the idea. <br/>
Look at the script in /usr/local/bin for the rest of the options.

- Swapid script for the frequent dual installer. This grabs your swap uuid and opens the appropriate windows to edit. <br/>
Run swapid in a terminal after installing another distro to a different partition.

- ld-hotcorners - Each corner of the screen responds to a command. <br/>
Turn it on with the button in the lower left corner or under Toggles in the menu. <br/>
Change the corners in ~/.config/ld-hotcorners. <br/>
Currently clockwise from top left: __Thunar, Compton toggle, Exit menu, urxvt terminal__. <br/>

- This ISO has about everything you could need for simple tasks while still quite responsive.

- This build running live uses around 300MB ram. <br/>
Installed: around 280MB <br/> 

This iso comes in at 1.18 GB

Installed extras include but not limited to: <br/>
bash-completion /
catfish /
compton /
conky /
curl /
dmenu /
dunst /
feh /
firefox-esr /
fluxbox /
fortunes / 
geany /
gimp /
gparted /
kernel remover /
ld-hotcorners /
libreoffice /
lightdm-gtk-greeter-settings /
lxterminal /
mousepad /
nano /
newsboat /
obconf /
obmenu /
pcmanfm /
pnmixer /
rofi /
rsync /
rxvt-unicode / 
synaptic /
tint2 /
transmission-gtk /
wicd /
winfuncs /
xbindkeys-config /

 
Follow the instructions below to build your own iso using the Debian Live-build system:)

### Instructions for building your own if you so choose!
Download the Lilidog zip from the github code box at the top of this page. (Not the huge green Download:)
Unzip the file somewhere to reveal the folder inside.  You will not be building directly in <br/>
this folder.  It is to copy files from only, and can be deleted once you have a build.

Open a terminal and:
```sh
sudo apt install live-build live-config live-boot
```
Be aware that neither live-boot nor live-config are necessary for the build, <br/>
but having the information is good (man pages and such), and won't hurt anything.

Now make the directory we will be working from and copy the template over:
```sh
mkdir -p Lilidog/auto

cp /usr/share/doc/live-build/examples/auto/* Lilidog/auto/  

cd Lilidog
```
Open a couple of file-manager instances to make life easier, and then:

Replace the config in Lilidog/auto with the same file from the Lilidog clone you downloaded and unzipped then:
```sh
lb config
```
This will populate the folder. Go up a level to see.

Now open up Lilidog/config.

Make a folder in Lilidog/config named **bootloaders** and make sure to copy from the

**/usr/share/live/build/bootloaders** on **YOUR** computer:

Now copy the **isolinux** and **syslinux** folders to the /config/bootloader folder you made in Lilidog. 

Or easier, copy the whole bootloaders folder over to Lilidog/config, and delete everything inside but isolinux and syslinux. 

**In the isolinux folder**, Replace the advanced.cfg and the splash.svg with those from the lilidog clone. (replace with the splash.png)

**In the syslinux folder**, replace just the splash.svg with the splash.png.

Next is to copy over the configuration files from the Lilidog Clone.

Replace __includes.chroot__, __includes.installer__, and  __package-lists__  with those from the Lilidog clone. <br/>
This is when you should make any other changes you wish. Look at the package list to add or remove packages. <br/>
Do you need firmware-b43legacy-installer? <br/>
Recommend running the build once before making your own changes.

Now, while still in ~/Lilidog in terminal:

```sh
sudo lb clean

Sudo lb build
```
The usual bit about getting some coffee/tea here is a good idea.


Live build fails occasionally during the build for no good reason I can see. <br/>
Simply try lb build again without cleaning until it builds properly, <br/>
or if obviously won't build after a few tries, use __lb clean__ and try again. <br/>
Seriously, keep trying. Like it is meant to throw you off.  Remember, NOTHING is <br/>
pushed to git unless it produced the desired results.   i.e, worked.

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
The only installer I am using is the expert Debian text installer in the menu. 

If you would like to work on your own distro after building, install to a separate partition ONLY to build from. <br/> 
The whole system becomes your template. Think clone within a clone.

Follow the examples here for further ideas. A whole new world just opened up if you do:) <br/>
https://live-team.pages.debian.net/live-manual/html/live-manual/examples.en.html#tutorial-1

- Please "star" this site!  This lets others know there is something worthwhile here. <br/>
- Ask questions here, or on Sourceforge. <br/>
- Feel free to link this page. This is how others also get to try new things. <br/>

Contact info: sleekmason@gmail.com

### Good Luck!

__Credits__

The linux rocks are my wifes:) She paints rocks, and I like em. <br/>
The rabbit is a local image on the side of a building. Apt for the times. <br/>
The Cracked Window is from one of our backpacking trips. An old truck, 2000' down. <br/>
The "Lis" is a changed copy from a print we have.
The Grub image is Lili out playing in the snow.

## Lilidog

[![Lili.png](https://i.postimg.cc/hjy8qYS8/Lili.png)](https://postimg.cc/5YzQBnQj)


