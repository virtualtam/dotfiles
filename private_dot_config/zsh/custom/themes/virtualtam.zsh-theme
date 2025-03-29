#!/bin/zsh
# VirtualTam's ZSH Theme
#
# Example, minus colors and formatting:
#
# ╭ virtualtam@aaron( ~/.dots/zsh/custom/themes ) [master●] [py2:tb2]
# ╰ 2018-12-23 01:26:03 ≻
#
# First row for context:
# - user login
# - hostname
# - current path
# - SCM
# - Python virtualenv
#
# Second row for command execution:
# - date and time
# - command prompt, completions, suggestions
#
# This prompt is designed to provide relevant information when working on
# multiple hosts, and helps keeping track of when commands were run, e.g. when
# resuming screen/tmux sessions.

# TMOUT - periodically send ALRM signal after ${TMOUT} seconds of inactivity
#
# If this parameter is nonzero, the shell will receive an ALRM signal if a
# command is not entered within the specified number of seconds after issuing
# a prompt.
TMOUT=20

TRAPALRM() {
    # Reset the prompt after ${TMOUT} seconds of inactivity
    #
    # Set TMOUT to a high enough value to avoid breaking ZSH widgets, such as
    # completion, suggestions and history browsing.
    if [[ ! "$WIDGET" =~ "complete" ]]
    then
        zle reset-prompt
    fi
}

# SCM
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# SCM formatting
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
FMT_ACTION=' %F{green}%a%f'
FMT_BRANCH=' [%F{cyan}%b%u%c%f]'
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

function _virtualenv_info() {
    # Display information about the current Python virtualenv
    if [[ -n "${VIRTUAL_ENV}" ]]
    then
        local venv=$(basename ${VIRTUAL_ENV})
        local pyver=$(python -c 'import platform; print(platform.python_version_tuple()[0])')
        echo " [%F{blue}py${pyver}%F{yellow}:%f${venv}%f]"
    fi
}

# Unicode eye candy
case "${TERM}" in
    alacritty | screen | rxvt-unicode* | tmux-* | xterm*)
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

# Login color
# - root: red
# - user: green
if [[ $UID -eq 0 ]]; then
    local user="%F{red}%B%n%b%f"
    local user_arrow="%F{red}${arrow}%f"
else
    local user="%F{green}%B%n%b%f"
    local user_arrow="%f${arrow}%f"
fi

local host="%B%F{magenta}%m%f%b"
local current_dir="%F{blue}%B%~%b%f"

PROMPT='${top_brace}${user}@${host}( ${current_dir} )${vcs_info_msg_0_}$(_virtualenv_info)%f
${bot_brace}%B%D{%Y-%m-%d %H:%M:%S}%b ${user_arrow} '

# Display the status code of the last executed command in the top-right corner
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
RPS1="%B${return_code}%b"
