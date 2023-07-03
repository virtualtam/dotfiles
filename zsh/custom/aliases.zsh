#!/bin/zsh
# ZSH aliases

# directories
alias mcd='takedir'

# helix
if [[ ! -x $(which hx) ]]
then
    alias hx='helix'
fi

# ip
alias ip='ip --color'
alias ipb='ip --brief'

# infrastructure
alias vg='vagrant'
alias tf='terraform'

# media
alias ydl='yt-dlp'

# ssh
alias tssh='TERM=xterm ssh'

# tree
alias tl='tree -ph'
alias ta='tree -pha'

# vim

# vrg runs a search with ripgrep and opens the results in a Vim quickfix window.
function vrg() {
    vim -q<(rg --vimgrep --smart-case $@) +"copen 15"
}

# vvrg runs a search with ripgrep and opens the results in a Vim quickfix window
# (vertical split).
function vvrg() {
    vim -q<(rg --vimgrep --smart-case $@) +copen +"wincmd L"
}
