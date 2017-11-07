#!/bin/zsh
# ZSH Theme

case "${TERM}" in
    screen | rxvt-unicode* | xterm*)
        # fancy unicode
        local top_brace='╭ '
        local bot_brace='╰ '
        local arrow='≻'
        ;;
    *)
        # simple terms
        local top_brace=''
        local bot_brace=''
        local arrow='>'
esac

if [[ $UID -eq 0 ]]; then
    local user='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
    local user_arrow='%F{red}${arrow}%f'
else
    local user='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
    local user_arrow='%f${arrow}%f'
fi

local host='%{$terminfo[bold]$fg[magenta]%}%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'

local git_branch='$(git_prompt_info)%{$reset_color%}'

local python_env=''
[[ -n "${VIRTUAL_ENV}" ]] && python_env="($(basename ${VIRTUAL_ENV})) "


PROMPT="${top_brace}${user}@${host}( ${current_dir} ) ${git_branch}
${bot_brace}%B%D{%Y-%m-%d %H:%M:%S}%b ${python_env}${user_arrow} "

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
