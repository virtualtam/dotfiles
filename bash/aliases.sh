# ~/.bash_aliases

function take() {
    # create and switch to a directory
    mkdir -p ${1}
    cd ${1}
}
alias md='mkdir'

# less colors
export LESS_TERMCAP_mb=$'\e[1;31m'    # begin blinking
export LESS_TERMCAP_md=$'\e[1;31m'    # begin bold
export LESS_TERMCAP_me=$'\e[0m'       # end mode
export LESS_TERMCAP_se=$'\e[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\e[0;40;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'       # end underline
export LESS_TERMCAP_us=$'\e[1;32m'    # begin underline

# pager
export MANPAGER='less -s -M +Gg'
export PAGER='less -s'

# GnuPG CLI agent
export GNUPG_TTY=$(tty)

# ls
alias ll='ls -lh'
alias la='ls -lAh'
alias lol='ls -lh --color=no'
alias loa='ls -lAh --color=no'

# tree
alias tl='tree -ph'
alias ta='tree -pha'

# R
alias R='R --quiet'

# iii];p
alias rm='rm --preserve-root'
