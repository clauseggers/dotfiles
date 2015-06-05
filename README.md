My .dotfiles
============

![Gnome terminal running various applications](https://raw.githubusercontent.com/clauseggers/dotfiles/master/screenshot.png)

### Dependencies ###
* [Input typeface family](http://input.fontbureau.com/) (Gratis for personal use)
* [Oh My Zsh!](http://ohmyz.sh/) (Open Source)
* [Solarized Dark colorscheme](http://ethanschoonover.com/solarized) (Gratis)
* `xterm-256color-italic` terminal description
* [Paper theme and icons](http://snwh.org/paper/) (for Gnome)
* You should create your own `.secrets` file in the root of your home folder.

### Optional dependencies ###
###### GUI applications ######
* MacVim
* Gvim

###### CLI applications ######
* VIM
* GIT
* GOACCESS
* LFTP
* IRSSI
* SLRN
* NEWSBEUTER
* LYNX
* MIDNIGHT COMMANDER

### Installation ###
* Run the shell-command `tic xterm-256color-italic.terminfo` in your home-folder.
* Install the Input fonts.
* Install Oh My Zsh!
* Open Vim and run `:PluginInstall`, then close and re-open Vim. (Please note that several of specified Vim Plugins have additional dependencies.)
* Copy the dotfiles to your home directory root. (Merge directories and overwrite files if asked.)
* Set your default terminal to the Solarized Dark colorscheme, and the default shell to ZSH. Set the default font to Input Mono Narrow. Close and re-open the Terminal emulator.

### Issues ###
* In GNU/Linux it is recommended to also copy these base-settings into the root account and run the installers. That way you can get a more complete and consistent experience when you are logging into the root account or doing `su` from the console.
* CLI applications in general, should be compiled for your ncurses/slang version. If not the colors can be all screwy.
* Speaking of colors, LYNX does not support the proper default background colour from the Solarized Dark colour scheme. The colour support in Newsbeuter is currently partially broken, so that the Solarized themeing break in the article headers. SLRN has such minor issue as well.

### Notes ###
This should work for both GNU and OS X. Depending on the particular implementation of the font rendering engine you might have to try the differently leaded versions of the Input font. You can select this on the download page. If you are using Gnome Terminal then the correct leading is 1.3.

To enable the Paper theme in Gnome you must have `Tweak Tool` installed, and the Gnome extension `User Themes` enabled. The close Tweak Tool, re-open it, set the Input fonts in the `Fonts` subpanel, and the Paper theme in the `Apperance` subpanel with `Claus` as the `Shell theme`. You can of course rename the folder `Claus` in the `.themes` folder to any other name you would like.

The `.fonts.conf` file is exclusively used by Firefox and is necessary because Firefox is not build against GTK+, and thus not under the control of the system settings.

### License ###
You are free to do as you please with these files.
