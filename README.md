# Lilidog is based on Debian Bullseye. With Openbox & Fluxbox, 32 bit and 64 bit versions.<br/>

The different window managers can be accessed through the login screen. Lilidog boots to <br/>
Openbox by default.

You can download the full ISO from here:

###NOTE
The Download button defaults to the stable 64 bit version (Bullseye).

[![Download Lilidog](https://a.fsdn.com/con/app/sf-download-button)](https://sourceforge.net/projects/lilidog/files/latest/download)

Lilidog-Sid (unstable) and the i386 version have a release as well: https://sourceforge.net/projects/lilidog/files/Releases/

 
[![Lilidog2-Slate.png](https://i.postimg.cc/fLzfRksj/Lilidog2-Slate.png)](https://postimg.cc/McLQs6vv) <br/>

[![Lilidog-Clay2.png](https://i.postimg.cc/x1n8vWPH/Lilidog-Clay2.png)](https://postimg.cc/ppcPxc4X) <br/>

[![Trees.png](https://i.postimg.cc/QMxcNB9F/Trees.png)](https://postimg.cc/v4k43Zvy) <br/>

[![Lilidog.png](https://i.postimg.cc/1X1s9qC6/Lilidog.png)](https://postimg.cc/mzj0jtG2) <br/>

### Features:

- Based on Debian bullseye with contrib and non-free sources enabled by default. <br/>
Debian backport sources can be added during installation. __Please use the the "expert installer" to add backports.__

- This is a no --recommends build! This means only dependancies are included during package install. <br/>
This leaves out any suggested or recommended packages, allowing for better control over package installation, <br/>
with no unwanted packages installed by default.  This can be changed after install if desired.

- Switch between four different panels on the fly. - Customize your own to be toggled when desired.

- The username and password for the live environment is "user", and "live" respectively. <br/>

- Fully customized Jgmenu has been implemented for both versions, with numerous options available.

- Dmenu and Rofi for alternate menu sources. - ALT + F2 pulls the full Dmenu up, while ALT + F3 pulls up a <br/>
customized Dmenu with only the most commonly used apps. ALT + F5 pulls up Rofi.

- Tint2 panel by default in Openbox, with options for FbPanel, Plank, or Monsterpanel. <br/>
Monster panel is a combination of the pager and icon control from Fbpanel, with everything else Tint2. <br/>
Try Fbpanel or Monsterpanel in the live environment under 'Toggles' in the menu.

- There are shortcuts for Alsamixer in the volume icon and xfce4-power-manager in the battery icon. <br/>
To see time format options for 24 hour vs. 12 hour, middleclick over the time for the man page. <br/>
Hover over the icons to see what they are.  

- X-screensaver and other handy startup apps readily available through the toggles in the menu <br/>

- Thunar is the default file manager, with Pcmanfm and Spacefm as alternatives to explore.  Custom right-click <br/> 
options for each are already enabled.  See what you like best.

- Four Custom themes with matching Geany themes ranging from light to dark. <br/> 
The fonts are Liberation Sans, except for urxvt and Conky, where Dejavu is used.

- Lxterminal by default for Thunar and the menu. URXVT terminal also available, and has font size control (ctl+up/down), <br/> 
transparency and the ability to open urls. <br/>

- Conky has all sorts of relevant info, including connected drives, number of packages installed, and more. <br/>
For drive information, you may wish to edit the script in  ~/.config/conky/scripts. Directions included.

- Desktop icons can be enabled and customized using pcmanfm. <br/>

- Compton Composite Manager with transparency enabled. Change to suit.

- Newsboat RSS reader with a custom configuration already in place and ready for new RSS feeds.

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

Download the full ISO from the green download box above, or follow <br/>
the instructions below to build your own iso using the Debian Live-build system:)

### Instructions for building your own if you so choose!

Download the Lilidog zip from the github code box at the top of this page. (Not the huge green Download:) <br/>
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


