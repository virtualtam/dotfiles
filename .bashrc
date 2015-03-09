# ~/.bashrc
# author	VirtualTam	<virtualtam@flibidi.org>

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# User color prompt
PS1='\[\033[01;32m\]AT\[\033[00m\]( \[\033[01;34m\]\w\[\033[00m\] ) $ ';

# Root color prompt
# if [ `tty | sed s/[0-9]//` = "/dev/pts/" ]
# then
#     xset -b;
#     PS1='╭ \[\033[01;31m\]ROOT\[\033[00m\]{ \[\033[01;34m\]\w\[\033[00m\] }'
#     PS1+='\n╰ \[\033[01;30m\]\t\[\033[00m\] ≻ ';
# else
#     PS1='\[\033[01;31m\]ROOT\[\033[00m\]{ \[\033[01;34m\]\w\[\033[00m\] } § '
# fi

case "$TERM" in
    rxvt-unicode-256color | xterm)
	PS1='╭ \[\033[01;32m\]AT\[\033[00m\]( \[\033[01;34m\]\w\[\033[00m\] )'
	PS1+='\n╰ \[\033[01;30m\]\t\[\033[00m\] ≻ ';
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

# Text & Editors
export MANPAGER='most'
export PAGER='more -f'

# ROOT utils
complete -cf sudo
alias grubconf='grub-mkconfig -o /boot/grub/grub.cfg'

# Alias definitions
if [ -f  ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
