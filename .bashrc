#!/usr/bin/enable/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Set flags to avoid terrible mistakes
set -o pipefail # Exit on error in pipe-segment
set -o errexit  # Exit on error
set -o nounset  # Trigger error when expanding unset variables
IFS=$'\n\t'

# Include the .shellcommon file
if [ -f ~/.shellcommon ]; then
  source ~/.shellcommon
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  # Turn the prompt symbol red if the user is root
  if [ $(id -u) -eq 0 ];
  then # you are root, make the prompt red
    PS1='\[\e[1m\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$\[\e[0m\] '
  else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  fi
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Disable flow control for commands in Vim
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
  # osx users, use stty -g or remap specific shortcuts in System Preferences >
  # Keyboard > Shortcuts > App Shortcuts > Add for Terminal...
  local STTYOPTS="$(stty --save)"
  stty stop '' -ixoff
  command vim "$@"
  stty "$STTYOPTS"
}

# Remaps CAPS-LOCK to Esc, aka. `Meta` in Vim.
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Source completion-file for `t` the Ruby GEM twitter client
# if [ -f "$HOME/.scripts/t-completion.sh" ]; then
#   unalias t 2> /dev/null ||:
#   source "$HOME/.scripts/t-completion.sh"
# fi

# Globbing dotfiles
shopt -s dotglob

# (BASH ONLY) Use control+arrow keys to move forward and back in words
case $OS in
  "Darwin" )
    bind '"\e^[[C":forward-word';
    bind '"\e^[[D":backward-word';;
  "Linux"  )
    bind '"\e[1;3C":forward-word';
    bind '"\e[1;3D":backward-word';;
  "FreeBSD"  )
    bind '"\e[1;3C":forward-word';
    bind '"\e[1;3D":backward-word';;
esac
