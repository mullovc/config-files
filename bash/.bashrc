# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# allows you to cd into directory merely by typing the directory name
shopt -s autocd

stty -ixon

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set Powerline-like prompt
# for ANSI escape sequences check https://en.wikipedia.org/wiki/ANSI_escape_code
prompt_bg_color="31"
prompt_fg_color="231"
#[ -n "$RANGER_LEVEL" ] && prompt_bg_color="1"
PS1="\[\033[0;48;5;${prompt_bg_color};38;5;${prompt_fg_color};1m\] \W \[\033[0;38;5;${prompt_bg_color};49m\] \[\033[0m\]"
if [ -n "$RANGER_LEVEL" ]
then
    prompt_old_bg_color="$prompt_bg_color"
    prompt_bg_color="127"
    prompt_fg_color="17"
    PS1="\[\033[0;48;5;${prompt_bg_color};38;5;${prompt_fg_color};1m\]  \[\033[0;38;5;${prompt_bg_color};48;5;${prompt_old_bg_color}m\]${PS1}"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias diff='diff --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

# source aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

source /usr/share/fzf/key-bindings.bash

export VISUAL=/usr/bin/nvim
export LESS=-R
