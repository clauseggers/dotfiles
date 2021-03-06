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
* [MacVim (OS X)](https://github.com/macvim-dev/macvim/releases)
* Gvim (Linux)
* [Dash (OS X)](https://kapeli.com/dash)
* [Zeal (Linux)](http://zealdocs.org/)

###### Shell ######
* [ZSH](http://www.zsh.org/) with [OH-MY-ZSH](http://ohmyz.sh/)

###### CLI applications ######
* [VIM – Text editor](http://www.vim.org/)
* [MUTT – Email client](http://www.mutt.org/)
* [KHAL – Calendar](https://github.com/geier/khal)
* [KHARD – Address book](https://github.com/scheibler/khard/)
* [WEECHAT – IRC chat client](https://weechat.org/)
* [SLRN – USENET client](http://slrn.sourceforge.net/)
* [NEWSBEUTER – RSS client](http://www.newsbeuter.org/)
* [W3M – Web-browser](http://w3m.sourceforge.net/)
* [TURSES – Twitter client](https://github.com/dialelo/turses)
* [RTV – Reddit client](https://github.com/michael-lazar/rtv)
* [GODU – Disk-usage browser](https://github.com/viktomas/godu)
* [MOP – Stock ticker](https://github.com/brandleesee/mop)
* [WEGO – Weather](https://github.com/schachmat/wego)
* [MYCLI – SQL database query interface](http://mycli.net)
* [TLDR – Abbreviated help system](https://pypi.python.org/pypi/tldr/0.3)
* [TIG – Git history browser](https://github.com/jonas/tig)
* [HTOP – Interactive process browser](https://hisham.hm/htop)
* [NMON – Simple system performance monitor](http://www.ibm.com/developerworks/aix/library/au-analyze_aix/)
* [VIFM – Filemanager](https://vifm.info)
* [NCFTP – FTP client](http://www.ncftp.com/)
* [RG – Fast GREP replacement](https://github.com/BurntSushi/ripgrep)

### Installation ###
* Install the Input fonts.
* Install Oh My Zsh!
* Clone [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting) into `~/.oh-my-zsh/custom/plugins/`.
* Copy the dotfiles to your home directory root. (Merge directories and overwrite files if asked.)
* Run the shell-command `tic xterm-256color-italic.terminfo` in your home-folder.
* Set your default terminal to the Solarized Dark colorscheme, and the default shell to ZSH. Set the default font to Input Mono Narrow. Close and re-open the Terminal emulator.
* Install [Vundle](https://github.com/VundleVim/Vundle.vim)
* Open Vim and run `:PluginInstall`, then close and re-open Vim. (Please note that several of specified Vim Plugins have additional dependencies and need to be built from the `~/.vim/bundle/[PlugIn]/` directories.)
* To look up documentation in Vim please install Dash on the Mac, and Zeal on Linux.
* Mutt can be configured in an almost infinite number of ways. I strongly recommend getting the developer version over the very old stable version. I can only recommend reading the [official documentation](http://www.mutt.org/doc/devel/manual.html), and avoid the mostly outdated information you can find online. Mutt also installs a number of helpful template files in your `doc` dir.
* Khal and Khard requires [`vdirsyncer`](https://github.com/untitaker/vdirsyncer) to sync your calendars with other services. I use it with iCloud, Facebook events, and various other event calendars. `vdirsyncer` is installed as a dependency of Khal.

### Issues ###
* In GNU/Linux it is recommended to also copy these base-settings into the root account and run the installers. That way you can get a more complete and consistent experience when you are logging into the root account or doing `su` from the console.
* CLI applications in general, should be compiled for your ncurses/slang version. If not the colors can be all screwy.

### Notes ###
This should work for both GNU and OS X. Depending on the particular implementation of the font rendering engine you might have to try the differently leaded versions of the Input font. You can select this on the download page. If you are using Gnome Terminal then the correct leading is 1.3.

To enable the Paper theme in Gnome you must have `Tweak Tool` installed, and the Gnome extension `User Themes` enabled. The close Tweak Tool, re-open it, set the Input fonts in the `Fonts` subpanel, and the Paper theme in the `Apperance` subpanel with `Claus` as the `Shell theme`. You can of course rename the folder `Claus` in the `.themes` folder to any other name you would like.

The `.fonts.conf` file is exclusively used by Firefox and is necessary because Firefox is not build against GTK+, and thus not under the control of the system settings.

### License ###
You are free to do as you please with these files.
