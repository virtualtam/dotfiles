#!/bin/zsh
# ZSH aliases

# directories
function mcd() {
    mkdir -p ${1}
    cd ${1}
}

# tree
alias tl='tree -ph'
alias ta='tree -pha'
