# ~/.bashrc
# author	VirtualTam	<virtualtam@flibidi.net>

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Python virual environments
export PROJECT_HOME='~/python'
export WORKON_HOME='~/virtualenvs'
[[ -n "${VIRTUAL_ENV}" ]] && VPS1="($(basename ${VIRTUAL_ENV})) "

# User color prompt
PS1='\e[01;32m\]AT\e[00m\]( \e[01;34m\]\w\e[00m\] ) ${VPS1}$ ';

# Root color prompt
# if [ `tty | sed s/[0-9]//` = "/dev/pts/" ]
# then
#     PS1='╭ \e[01;31m\]ROOT\e[00m\]{ \e[01;34m\]\w\e[00m\] }'
#     PS1+='\n╰ \e[01;30m\]\t\e[00m\] ≻ ';
# else
#     PS1='\e[01;31m\]ROOT\e[00m\]{ \e[01;34m\]\w\e[00m\] } § '
# fi

case "$TERM" in
    screen | rxvt-unicode-256color | xterm)
	PS1='╭ \e[01;32m\]AT\e[00m\]( \e[01;34m\]\w\e[00m\] )'
	PS1+='\n╰ \e[01;39m\]\t\e[00m\] ${VPS1}≻ ';
	xset -b
	;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Java (moved to $JAVA_HOME/jre/lib/swing.properties)
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# ROOT utils
complete -cf sudo
alias grubconf='grub-mkconfig -o /boot/grub/grub.cfg'

# Text & Editors
export MANPAGER='most'
export PAGER='more -f'

# Alias definitions
if [ -f  ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
