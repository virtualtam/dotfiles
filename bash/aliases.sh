# ~/.bash_aliases

# Direcotries
function mcd() {
    # create and switch to a directory
    mkdir -p ${1}
    cd ${1}
}
alias md='mkdir'

# Editors
export MANPAGER='most'
export PAGER='more -f'

# Force TERM to rxvt so emacs doesn't mess up with Solarized
export EDITOR='emacs'
export VISUAL='emacs'

# GnuPG
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
