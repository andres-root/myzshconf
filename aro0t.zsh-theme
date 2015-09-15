local ret_status="%(?:%{$fg_bold[blue]%}➜ :%{$fg_bold[red]%}➜ %s)"
local shell_symbol="%(?:%{$fg_bold[blue]%}» :%{$fg_bold[red]%}✗ %s)"
local start="%{$fg_bold[blue]%}"
local end="%{$fg_bold[blue]%}${shell_symbol}%{$reset_color%}"
eval my_orange='$FG[214]'
eval my_gray='$FG[237]'

export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

 precmd_functions+=(virtenv_indicator)

PROMPT='${start}%{$fg_bold[cyan]%}${ret_status}%{$reset_color%}$my_gray%n@%m%{$reset_color%}$my_orange%(1V.(%1v).)%{$reset_color%}%{$fg_bold[green]%}%p %{$fg_bold[green]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
${end}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"