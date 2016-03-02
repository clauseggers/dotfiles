# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'

	alias zypper='zypper --color'
fi

# This will auto-correct your cludge
# alias fuck='sudo $(history -p \!\!)'

# Turn off fancy local `xterm-256color-italic` terminal definition when doing SSH to boxen that most likely will not have this definition.
alias ssh="TERM=xterm-256color ssh"

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ld='ls -Flahtr'

# Various tweaks
alias ping='ping -c 5'
alias clr='clear;echo "$fg[default]You are currently logged in on $fg[green]$(tty)$fg[default], as $fg[magenta]$USER $fg[default]in directory $fg[blue]$PWD$fg[default]"'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -pv'

# Show all files in `tree`
alias tree='tree -a'

# Search hidden files with the Silver Searcher
alias ag='ag --hidden'

# Add alias for su and sudo to use ZSH-shell
alias su='su --login -s /bin/zsh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Vi Improved
alias vi='vim'

# Use MacVim binary in OS X
case $OS in
	"Darwin" )
		alias view='/usr/local/bin/vim';;
esac

# Use Vim as `cat`
# alias cat='/usr/share/vim/current/macros/less.sh'

# Use Vim as `less`
if [ -d ~/.oh-my-zsh ]; then
	case $OS in
		"Darwin" )
			alias less='/usr/share/vim/vim73/macros/less.sh';;
		"Linux"  )
			alias less='/usr/share/vim/current/macros/less.sh';;
	esac
fi

# Clustergit
alias gitit='cd ~/Git/ && clustergit -p -H --recursive'

# Linux/GNU specific alias
case $OS in
	"Linux" )
		# Newsbeuter
		alias news='newsbeuter'

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
		alias cal='khal'

		# khard
		alias card='khard'

		# vifm
		alias f='vifm'

		# xdg-open
		alias open='xdg-open'
esac

# OS X specific alias
case $OS in
	"Darwin" )
		function frontfolder { osascript -e 'tell application "Finder"'\
			-e "if (${1-1} <= (count Finder windows)) then"\
			-e "get POSIX path of (target of window ${1-1} as alias)"\
			-e 'else' -e 'get POSIX path of (desktop as alias)'\
			-e 'end if' -e 'end tell'; };\
			
			function cdff { cd "`frontfolder $@`"; };
esac

