# ~/.bashrc
# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# Python virtual environments
export PROJECT_HOME='~/dev/python'
export WORKON_HOME='~/.virtualenvs'
[[ -n "${VIRTUAL_ENV}" ]] && VPS1="($(basename ${VIRTUAL_ENV})) "

# Username color
if [[ "$(whoami)" == "root" ]]; then
    USERCOLOR="31" # red
    alias grubconf='grub-mkconfig -o /boot/grub/grub.cfg'
else
    USERCOLOR="32" # green
fi

case "$TERM" in
    alacritty | screen | tmux* | xterm*)
        # fancy colorized unicode prompt
        PS1='╭ \[\033[01;${USERCOLOR}m\]\u\[\033[01;39m\]@\[\033[01;35m\]\h\[\033[00m\]'
        PS1+='( \[\033[01;34m\]\w\[\033[00m\] )'
        PS1+='\n╰ \[\033[01;39m\]\t\[\033[00m\] ${VPS1}≻ ';
        ;;
    *)
        # fancy colorized ascii prompt
        PS1='\[\033[01;${USERCOLOR}m\]\u\[\033[01;00m\]@\[\033[01;35m\]\h\[\033[00m\]'
        PS1+='( \[\033[01;34m\]\w\[\033[00m\] )'
        PS1+='\n\[\033[01;00m\]\t\[\033[00m\] ${VPS1}> ';
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
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Programmable completion features
complete -cf sudo
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# Show all completion matches and select the first one
#
# https://unix.stackexchange.com/questions/261687/is-it-possible-to-configure-bash-to-autocomplete-with-one-tab-like-zsh
# https://superuser.com/questions/288714/bash-autocomplete-like-zsh
# https://superuser.com/questions/1172624/bash-completion-always-show-all-files
set completion-ignore-case on
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Bind up/down arrows to cycle through history *search* results instead of
# previous/next history entry
#
# https://stackoverflow.com/questions/42299437/zsh-like-history-in-bash
# https://askubuntu.com/questions/59846/bash-history-search-partial-up-arrow
bind '"\e[A": history-search-backward'
bind '"\eOA": history-previous-history'
bind '"\e[B": history-search-forward'
bind '"\eOB": history-next-history'

# Bind C-w to kill a single word (until the next delimiter)
#
# https://superuser.com/questions/212446/binding-backward-kill-word-to-ctrlw
stty werase undef
bind '\C-w: backward-kill-word'

# Alias definitions
[[ -f  ~/.bash_aliases ]] && . ~/.bash_aliases
