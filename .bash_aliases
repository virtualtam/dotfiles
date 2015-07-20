# ~/.bash_aliases
# author	VirtualTam	<virtualtam@flibidi.net>

# Audio
alias mocp='padsp mocp'

# Dev
alias git='LANG=en_GB.UTF-8 git'

# Editors
# - force TERM to xterm (16 colors) so emacs doesn't mess up with Solarized
alias emax='TERM=xterm emacs -nw'
export EDITOR='TERM=xterm emacs -nw'
export VISUAL='TERM=xterm emacs -nw'

# Games
alias steam='steam && xsetroot -cursor_name left_ptr'
#alias doom3='doom3 +set s_alsa_pcm plughw:5 +set s_driver alsa'

# *nix
alias ll='ls -lh'
alias la='ls -lAh'

alias md='mkdir'
alias cd..='cd ..'

function mcd() {
    # create and switch to a directory
    mkdir -p ${1}
    cd ${1}
}

# R
alias R='R --quiet'

# SSH
alias vibi='ssh virtualtam@flibidi.net'
alias mibi='ssh minecraft@flibidi.net'

# iii];p
alias rm='rm --preserve-root'
