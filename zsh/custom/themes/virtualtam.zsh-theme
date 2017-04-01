# ZSH Theme
if [[ $UID -eq 0 ]]; then
    local user='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
    local user_arrow='%F{red}≻%f'
else
    local user='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
    local user_arrow='%f≻%f'
fi

local host='%{$terminfo[bold]$fg[magenta]%}%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'

local git_branch='$(git_prompt_info)%{$reset_color%}'

local python_env=''
[[ -n "${VIRTUAL_ENV}" ]] && python_env="($(basename ${VIRTUAL_ENV})) "


PROMPT="╭ ${user}@${host}( ${current_dir} ) ${git_branch}
╰ %B%D{%H:%M:%S}%b ${python_env}${user_arrow} "

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
