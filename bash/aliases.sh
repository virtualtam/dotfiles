# ~/.bash_aliases
function mcd() {
    # create and switch to a directory
    mkdir -p ${1}
    cd ${1}
}

# Dev
alias git='LANG=en_GB.UTF-8 git'

# Editors
export MANPAGER='most'
export PAGER='more -f'

# Force TERM to rxvt so emacs doesn't mess up with Solarized
alias emax='emacs'
export EDITOR='emacs'
export VISUAL='emacs'

# Games
alias steam='steam && xsetroot -cursor_name left_ptr'
#alias doom3='doom3 +set s_alsa_pcm plughw:5 +set s_driver alsa'

# *nix
alias ll='ls -lh'
alias la='ls -lAh'

alias md='mkdir'
alias cd..='cd ..'

# R
alias R='R --quiet'

# iii];p
alias rm='rm --preserve-root'
