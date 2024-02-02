#!/usr/bin/enable/env bash

# Alias GNU `coreutils` in FreeBSD and enable color support
case $OS in
"FreeBSD")
	if [ -x /usr/local/bin/gdircolors ]; then
		test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
		alias ls='gls --color=auto -F'
		alias dir='gdir --color=auto'
		alias vdir='gvdir --color=auto'
		alias ll='gls -alhF --color=auto -F'
		alias la='gls -A --color=auto -F'
		alias l='gls -CF --color=auto -F'
		alias ld='gls -Flahtr --color=auto -F'
	fi
	;;
esac

# Alias GNU `coreutils` in Mac OS X and enable color support
case $OS in
"Darwin")
	if [ -x /opt/homebrew/bin/gdircolors ]; then
		test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
		alias ls='gls --color=auto -F'
		alias dir='gdir --color=auto'
		alias vdir='gvdir --color=auto'
		alias ll='gls -alhF --color=auto -F'
		alias la='gls -A --color=auto -F'
		alias l='gls -CF --color=auto -F'
		alias ld='gls -Flahtr --color=auto -F'
	fi
	;;
esac

# Alias GNU `coreutils` in Linux and enable color support
case $OS in
"Linux")
	if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls='ls --color=auto -F'
		alias ll='ls -alhF --color=auto -F'
		alias la='ls -A --color=auto -F'
		alias l='ls -CF --color=auto -F'
		alias ld='ls -Flahtr --color=auto -F'
		alias dir='dir --color=auto'
		alias vdir='vdir --color=auto'

		alias grep='grep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias egrep='egrep --color=auto'

		alias zypper='zypper --color'

		alias ip='ip --color'
	fi
	;;
esac

# This will auto-correct your cludge
# alias fuck='sudo $(history -p \!\!)'

# Turn off fancy local `xterm-256color-italic` terminal definition when doing SSH to boxen that most likely will not have this definition.
alias ssh="TERM=xterm-256color ssh"

# Exit with the quickness
alias x='exit'

# Get size of 1st-level sub-directories, ordered
case $OS in
"Linux")
	alias ds='du -hs * | sort -h'
	;;
"Darwin")
	alias ds='du -hs * | sort -h'
	;;
"FreeBSD")
	alias ds='gdu -sb -t 100000 * | gsort -nr | gnumfmt --to=iec-i | column -t'
	;;
esac

# Various tweaks
alias ping='ping -c 5'
alias clr='clear;echo "$fg[default]You are currently logged in on $fg[green]$(tty)$fg[default], as $fg[magenta]$USER $fg[default]in directory $fg[blue]$PWD$fg[default]"'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -pv'

# Show all files in `tree`
alias tree='tree -N'

# Search hidden files with the Silver Searcher
alias ag='ag --hidden'

# Search hidden files and case-insensitive with `ripgrep`
# alias rg='rg -i -uu --hidden --colors '"'"'path:fg:magenta'"'"' --colors '"'"'match:fg:red'"'"' --colors '"'"'line:fg:white'"'"
alias rg='rg -i --hidden'

# nnn file browser
alias b='nnn'

# vifm
# alias f='vifm'

# Add alias for su and sudo to use ZSH-shell
case $OS in
"Linux")
	alias su='su --login -s $(which zsh)'
	;;
"Darwin")
	alias su='su --login -s $(which zsh)'
	;;
"FreeBSD")
	# alias su='su -l -s $(which zsh)';;
	alias su='su -l -s'
	;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# NeoVim
alias vi='nvim'

# Use Vim as `cat`
# alias cat='/usr/share/vim/current/macros/less.sh'

# Use Vim as `less`
# if [ -d ~/.oh-my-zsh ]; then
#   case $OS in
#     "Darwin" )
#       alias less='/usr/share/vim/vim82/macros/less.sh';;
#     "Linux"  )
#       alias less='/usr/share/vim/current/macros/less.sh';;
#     "FreeBSD"  )
#       alias less='/usr/local/share/vim/vim82/macros/less.sh';;
#   esac
# fi

# Clustergit
alias gitit='cd ~/Git/ && clustergit -p -H --recursive'

# 'ncmpcpp' MPD client
alias m='ncmpcpp'

# Newsboat
alias news='newsboat'
alias n='newsboat'

# Ticker
alias t='ticker'

# Linux/GNU specific alias
case $OS in
"Linux")
	# slrn Usenet client
	alias usenet='slrn'

	# Lynx
	alias lx='lynx'

	# lftp
	alias ftp='lftp'

	# IRC
	alias irc='weechat'

	# GoAccess
	alias goa='sudo goaccess --log-format "%h %^[%d:%t %^] \"%r\" %s %b \"%R\" \"%u\"" --date-format "%d/%b/%Y" --time-format "%H:%M:%S" -f /var/log/apache2/access_log'

	# iftop
	alias iftop='sudo iftop -c .iftoprc'

	# khal
	alias cal='ikhal'

	# khard
	alias card='khard'

	# xdg-open
	alias open='xdg-open'

	# `htop` as top
	alias top='htop'

	# Fix TERM env for `godu`
	alias godu='env TERM=xterm-256color godu'

	# Config-file for `multitail`
	alias multitail='multitail --config $HOME/.config/multitail.conf'
	alias mtl=multitail

	# Rename util
	alias rename='renamex'

	# Ticker installed via Snap needs non-dotfile config.
	# alias ticker='ticker --config $HOME/ticker.yaml'

	# Email
	alias e='neomutt'

	# Find files and directories
	# Unalias `fd` and `ff` from the ZSH-plugin `common-aliases.plugin.zsh`
	unalias fd 2>/dev/null || :
	unalias ff 2>/dev/null || :
	# In some distros `fd` has been renamed `fd-find` or `fdfind`. This is aliased thusly:
	# alias fd='fdfind'
	# Set hidden inluded as default.
	alias fd='fd --hidden --no-ignore '

	# StarDict / `sdcv`
	dict() {
		sdcv -n --utf8-input --utf8-output --color "$@" 2>&1 |
			fold --width="$(tput cols)" |
			w3m
	}
	;;

esac

# OS X specific alias
case $OS in
"Darwin")
	function frontfolder { osascript -e 'tell application "Finder"' \
		-e "if (${1-1} <= (count Finder windows)) then" \
		-e "get POSIX path of (target of window ${1-1} as alias)" \
		-e 'else' -e 'get POSIX path of (desktop as alias)' \
		-e 'end if' -e 'end tell'; }

	function cdff { cd "$(frontfolder "$@")" || exit; }

	# Use NeoVim binary in OS X
	case $OS in
	"Darwin")
		alias view='/usr/local/bin/nvim'
		;;
	esac

	# Find files and directories
	# Unalias `fd` and `ff` from the ZSH-plugin `common-aliases.plugin.zsh`
	unalias fd 2>/dev/null || :
	unalias ff 2>/dev/null || :
	# Set hidden inluded as default.
	alias fd='fd --hidden --no-ignore '

	# `htop` as top
	alias top='htop'

	# HomeBrew upgrade, prune, and cleanup
	alias brewup='brew update; brew upgrade; brew upgrade --cask; brew cleanup; brew doctor'

	# Alias the Homebrew version of Python3 to python
	alias python=/opt/homebrew/bin/python3
	;;
esac

# Fedora specific alias
case $DISTNAME in
  "fedora" )
    # Update packages
    alias fedup='sudo dnf5 update --refresh'
esac

