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

# infrastructure
alias vg='vagrant'
alias tf='terraform'

# tree
alias tl='tree -ph'
alias ta='tree -pha'
