# Lilidog-Linux Based on Debian Buster (stable)
## LXDE - Openbox - Fluxbox Combo Optimized - 64 bit version.<br/>

Lilidog is a dark themed distro build based on LXDE with either Openbox <br/> 
or Fluxbox as the window manager.  Toggle freely between the two when in the default session. <br/>
Either can be accessed separately through the Lightdm login screen, but no toggling in this case.

Pretty much, Debian. With some of the hard parts done, and some cool stuff along the way. <br/>
Everything is easily accessible, with numerous options to customize.

### This is the stable version. Buster repos only.

__NOTE*__ If you would like this version with updated drivers from sid, and the newest kernel available<br/>
See: https://github.com/sleekmason/Lilidog-buster-w-custom-kernel

Be aware that in this case, newer doesn't always equate with better. <br/>
An rc kernel newly patched by debian may run slower than the kernel in stable. <br/>
Compiling your own vanilla kernel from https://www.kernel.org/ <br/>
after building a stable image is the way to go for optimization purposes. However, If you have <br/>
newer hardware, The firmware from sid and the newest Debian kernel available may be a saving grace. <br/>


### Instructions on building your own ISO of Lilidog are at the end of this page. Easy peasy.

[![Lilidog.png](https://i.postimg.cc/4yjn713c/Lilidog.png)](https://postimg.cc/y3X72cc6)

### Features:

Based on Debian Buster with contrib and non-free sources enabled by default. <br/>
Debian backport sources can be enabled during installation. 

Fluxbox now an option. A work in progress:)  In the live session, you can switch from Openbox to <br/>
Fluxbox and back through the toggles in the menu. <br/> Logging into each separately is also an option <br/>
The username and password for the live environment is "user", and "live" respectively. <br/>
Be aware that Conky doesn't always play nice through the toggle, but thats just a click away if needed.

Even though this is currently based on the Lxde-openbox combo, I have since separated out Openbox, <br/>
which can now be started on it's own in the lightdm login screen. Just another choice, <br/>
not necessarily better or worse. For pure Openbox and Fluxbox, Fonts are changed through ~/.Xresources.
 
Hybrid Monster panel by default in Openbox, with options for FbPanel, Lxpanel, or Tint2 panel. <br/>
Monster panel is a combination of the pager and icon control from Fbpanel, with everything else Tint2. <br/>
Try Fbpanel or Tint2 in the live environment under 'Toggles' in the menu. <br/>
There are shortcuts for Alsamixer in the volume icon and Htop in the battery icon. <br/>
To see time format options for 24 hour vs. 12 hour, middleclick over the time for the man page. <br/>
Hover over the icons to see what they are.  The live password is "live" for the screenlock.

If preferred, you can enable the Pnmixer icon in LxSession Autostart and remove the executor from tint2.<br/>
Make a backup of the tint2rc in case you change your mind, or see /etc/skel/.config/tint2 for the original.

X-screensaver and other handy startup apps readily available through Lxsession Autostart in the menu.

Custom right-click menu with ease of use in mind. Easy access to root options, configurations, and toggles. <br/>
Dmenu for an alternate menu source. - ALT + F2 pulls the full menu up, while ALT + F3 pulls up a <br/>
customized menu with only the most commonly used apps. <br/>
Another menu option using wbar with pre-cofigured values can be turned on with Alt + F5 <br/> 
There are four pre-made wbar lines ready to mix and match whatever you come up with.

PcManFM file manager has built in right-click options for Open in Terminal, and Open as Root.

Custom Lilidog Openbox and GTK theme, Gnome Brave Icons, and matching themes for Geany and Mousepad. <br/>
The Mousepad theme will need to be enabled under 'Edit' -> 'Preferences' in the app. <br/> 
The fonts are Liberation Sans, except for urxvt and Conky, where Dejavu is used. <br/>

URXVT terminal has font size control (ctl+up/down), transparency and the ability to open urls. <br/>
Lxterminal is readily available in the menu and launcher for those who prefer it.

Network-manager-gnome provided for internet access.

Conky has all sorts of relevant info, including connected drives. Fortune Cookies are in the Conky. <br/>
For drive information, you may wish to edit the script in  ~/.config/conky/scripts. Directions included.

Desktop icons can be enabled and customized using wbar (Warlock Bar). <br/>
Check wbar out in the live environment by toggling it from the menu or ld-hotcorners, Top-Left. <br/>
Easy to configure from the settings icon. Use on startup by enabling in Lxsession-autostart.

Compton Composite Manager with transparency enabled. Change to suit.

Newsboat RSS reader with a custom configuration already in place and ready for new RSS feeds.

BFQ IO Scheduler by Default. To change this to kernel default, delete 60-scheduler.rules in /etc/udev/rules.d

Feh sets the wallpaper directly in lxsession autostart rather than pointing to ~/.fehbg <br/>
After installation, you may want to change this to ~/.fehbg & in lxsession autostart for customization. <br/>
If you would prefer to use icons on the desktop, enable the pcmanfm --desktop --profile in Lxsession autostart.

My wife painted rocks for the wallpaper and I found I like them quite a bit:) Maybe you will too.<br/> 
Feel free to use them however you like, or delete them and point to something else. No worries:) <br/> 
They are mine/yours, not off the internet. 

System notifications enabled with Dunst. Set your own settings in ~/.config/dunst/dunstrc.

All scripts are in /usr/local/bin.  Some of the fun ones are: <br/>
winfuncs tiler - For tiling and such. Set your own keybinds! <br/>
Try: __winfuncs cascade__ or __winfuncs showdesktop__  in a terminal with a couple of windows open to get the idea. <br/>
Look at the script in /usr/local/bin for the rest of the options.

Swapid script for the frequent dual installer. This grabs your swap uuid and opens the appropriate windows to edit. <br/>
Run swapid in a terminal after installing another distro to a different partition.

ld-hotcorners - Each corner of the screen responds to a command. <br/>
Turn it on with the button in the lower left corner or under Toggles in the menu. <br/>
Change the corners in ~/.config/ld-hotcorners. <br/>
Currently clockwise from top left: __Wbar toggle, Compton toggle, Exit menu, urxvt terminal__. <br/>

This ISO has about everything you could need for simple tasks while still quite responsive.

Running live: uses around 300MB ram. <br/>
Installed: around 280MB <br/> 

Installed extras include but not limited to: <br/>
bash-completion /
catfish /
compton /
conky /
curl /
dmenu /
feh /
firefox-esr /
fortunes / 
geany /
gimp /
gparted /
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
rsync /
rxvt-unicode / 
synaptic /
tint2 /
transmission-gtk /
wicd /
winfuncs /
xbindkeys-config /

If you came here hoping to download The Lilidog Distro, I'm afraid it won't happen from here. <br/>
If somebody wanted to actually host the iso I would keep it updated and add cool stuff here and there. Well, I will anyway. 

But all is not lost!  You can build your own distro with everything above, and install it or just run it live. <br/>
Follow the instructions below to build your own iso using the Debian Live-build system:)

## Quick instructions: <br/>
Clone or download the Lilidog-Buster zip file so you have access to all the necessary files.
Open a terminal in the resultant folder and:
```sh
sudo apt install live-build
sudo lb build
```
Thats it. The iso will be in the main folder when completed. Read below for potential problems.

## Less quick, but you learn something and have control over the process.

### Recommended
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

Feel free to link this page:) <br/>
Good Luck!

Contact info: sleekmason@gmail.com

## Lilidog

[![Lili.png](https://i.postimg.cc/hjy8qYS8/Lili.png)](https://postimg.cc/5YzQBnQj)


