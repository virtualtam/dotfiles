# ~/.bashrc: ArchUser | ArchRoot
# author	VirtualTam
# created	2010-05-26
# updated	2013-03-13

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# User color prompt
PS1='\[\033[01;32m\]AT\[\033[00m\]( \[\033[01;34m\]\w\[\033[00m\] ) $ ';

# Root color prompt
# if [ `tty | sed s/[0-9]//` = "/dev/pts/" ]
# then
#     xset -b;
#     PS1='╭\[\033[01;31m\]ROOT\[\033[00m\]{ \[\033[01;34m\]\w\[\033[00m\] }\n╰≻ '
# else
#     PS1='\[\033[01;31m\]ROOT\[\033[00m\]{ \[\033[01;34m\]\w\[\033[00m\] } § '
# fi

case "$TERM" in
    rxvt-unicode-256color | xterm)
	PS1='╭\[\033[01;32m\]AT\[\033[00m\]( \[\033[01;34m\]\w\[\033[00m\] )\n╰≻ ';
	xset -b
	;;
esac

case "$COLORTERM" in
    gnome-terminal)
	# On gnome-terminal 3.8, keep the working dir when opening a new tab
	. /etc/profile.d/vte.sh
	#export PS1='\[$(__vte_ps1)\]'$PS1
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

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

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lAh'

# Compilation
alias gflag='gcc -W -Wall -Wextra -ansi -pedantic'
alias gdebug='gcc -W -Wall -Wextra -ansi -pedantic -g -pg -DNDEBUG'
alias mclean='make clean'
alias mdist='make distclean'

# External storage
MEDIA_FOLDER="/run/media/tamisier/"
alias k1='cd '${MEDIA_FOLDER}"DRS_K-1/"
alias k8='cd '${MEDIA_FOLDER}"DRS_K-8/"
alias n8='cd '${MEDIA_FOLDER}"DRS_N-8/"
alias d1='cd '${MEDIA_FOLDER}"D1_Media/"
alias d2='cd '${MEDIA_FOLDER}"D2_Softs/"

# Steam fix
alias steam='steam && xsetroot -cursor_name left_ptr'

# Spell shortcuts :p
alias md='mkdir'
alias cd..='cd ..'
#alias n.='nautilus .'

# MATÉ session
#if [ `ps -eo comm | grep session` = "mate-session" ]; then
#    alias n.='echo "Call me caja maybe!";caja .';
#    alias c.='caja .';
#    alias evince='echo "Call me atril maybe!";atril';
#    alias gedit='echo "Call me pluma maybe!";pluma';
#fi

# Java (moved to $JAVA_HOME/jre/lib/swing.properties)
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'\
' -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# Text & Editors
alias emax='emacs -nw'
export EDITOR="emacs -nw"
export MANPAGER='most'
#export VISUAL='/usr/bin/emacs -nw'

# SSH
alias vibi='ssh virtualtam@flibidi.org'
alias mibi='ssh minecraft@flibidi.org'

# ROOT utils
complete -cf sudo
#alias pacman='pacman-color' # Deprecated as of pacman 4.1.0
alias grubconf='grub-mkconfig -o /boot/grub/grub.cfg'

# iii];p
alias rm='rm --preserve-root'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
