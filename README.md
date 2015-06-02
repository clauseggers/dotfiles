My .dotfiles
============

![Gnome terminal running various applications](https://raw.githubusercontent.com/clauseggers/dotfiles/master/screenshot.png)

### Dependencies ###
* [Input typeface family](http://input.fontbureau.com/) (Gratis for personal use)
* [Oh My Zsh!](http://ohmyz.sh/) (Open Source)
* [Solarized Dark colorscheme](http://ethanschoonover.com/solarized) (Gratis)
* [Paper theme and icons](http://snwh.org/paper/) (for Gnome)
* You should create your own `.secrets` file in the root of your home folder.

### Optional dependencies ###
###### GUI applications ######
* MacVim
* Gvim

###### CLI applications ######
* VIM
* GIT
* CLUSTERGIT
* GOACCESS
* LFTP
* IRSSI
* SLRN
* NEWSBEUTER
* LYNX
* MIDNIGHT COMMANDER

### Installation ###
* Install the Input fonts.
* Install Oh My Zsh!
* Open Vim and run `:PluginInstall`, then close and re-open Vim. (Please note that several of specified Vim Plugins have additional dependencies.)
* Copy the dotfiles to your home directory root.
* Set your default terminal to the Solarized Dark colorscheme, and the default shell to ZSH. Set the default font to Input Mono Narrow. Close and re-open the Terminal emulator.

### Issues ###
* CLI applications must in general be compiled for your ncurses/slang version. If not colors can be all screwy.
* Speaking of colors, LYNX does not support the proper default background color. The colour support in Newsbeuter is currently broken so the Solarized themeing breake in the article headers. SLRN has such minor issue aswell. 

### Notes ###
This should work for both GNU and OS X. Depending on the particular implementation of the font rendering engine you might have to try the differently leaded versions of the Input font. You can select this on the download page. If you are using Gnome Terminal then the correct leading is 1.3.

To enable the Paper theme in Gnome you must have `Tweak Tool` installed, and the Gnome extension `User Themes` enabled. The close Tweak Tool, re-open it, set the Input fonts in the `Fonts` subpanel, and the Paper theme in the `Apperance` subpanel with `Claus` as the `Shell theme`.

### License ###
Do as you please with these files.
