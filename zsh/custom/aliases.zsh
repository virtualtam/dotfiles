#!/bin/zsh
# ZSH aliases

# ip
alias ip='ip --color'
alias ipb='ip --brief'

# directories
function mcd() {
    mkdir -p ${1}
    cd ${1}
}

# tree
alias tl='tree -ph'
alias ta='tree -pha'
