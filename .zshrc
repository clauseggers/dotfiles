# Include the .shellcommon file
if [ -f ~/.shellcommon ]; then
	source ~/.shellcommon
fi

# Initialize the ZSH built-in modules.
# fpath=(~/myfns $fpath)
# autoload -U zfinit
# zfinit

# Path to your oh-my-zsh installation.
if [ -d ~/.oh-my-zsh ]; then
	case $os in
		"Darwin" )
			export ZSH=/Users/$USER/.oh-my-zsh;;
		"Linux"  )
			export ZSH=/home/$USER/.oh-my-zsh;;
	esac
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Colored completion and dircolors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy/mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras sudo common-aliases dircycle web-search suse) 

# User configuration
DEFAULT_USER="claus"

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Release flow-control (eg. Ctrl+S in Vim)
unsetopt flowcontrol
stty stop undef
stty start undef

# Enables Vi(m)-emulation keymap mode
# source ~/.zsh/zle.zsh

# Source completion-file for `t` the Ruby GEM twitter client
if [ -f ~/t-completion.zsh ]; then
	unalias t
	source ~/t-completion.zsh
fi
