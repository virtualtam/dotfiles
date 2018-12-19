#!/bin/zsh
# ZSH Theme

# Prompt refresh
# If this parameter is nonzero, the shell will receive an ALRM signal if a
# command is not entered within the specified number of seconds after issuing
# a prompt
TMOUT=1

TRAPALRM() {
    zle reset-prompt
}

# VCS
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
FMT_ACTION=' %F{green}%a%f'
FMT_BRANCH=' - %F{cyan}%b%u%c%f'
FMT_STAGED='%F{green}●'
FMT_UNSTAGED='%F{yellow}●'

zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"

precmd() {
    vcs_info 'prompt'
}

# Python virtualenv
function _virtualenv_info() {
    if [[ -n "${VIRTUAL_ENV}" ]]
    then
        local venv=$(basename ${VIRTUAL_ENV})
        local pyver=$(python -c 'import platform; print(platform.python_version_tuple()[0])')
        echo " - %F{blue}py${pyver}%F{yellow}:%f${venv}%f"
    fi
}

case "${TERM}" in
    screen | rxvt-unicode* | xterm*)
        # fancy unicode
        local top_brace='╭ '
        local bot_brace='╰ '
        local arrow='≻'
        ;;
    *)
        # simple terms (for simple ricks)
        local top_brace=''
        local bot_brace=''
        local arrow='>'
esac

if [[ $UID -eq 0 ]]; then
    local user='%F{red}%n%f'
    local user_arrow="%F{red}${arrow}%f"
else
    local user='%F{green}%n%f'
    local user_arrow="%f${arrow}%f"
fi

local host='%F{magenta}%m%f'
local current_dir='%F{blue}%~%f'

PROMPT='${top_brace}${user}@${host}( ${current_dir} )${vcs_info_msg_0_}$(_virtualenv_info)%f
${bot_brace}%D{%Y-%m-%d %H:%M:%S} ${user_arrow} '

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
RPS1="%B${return_code}%b"
