autoload -Uz colors
colors

# enables parameter expansion, command expansion etc in prompts
setopt PROMPT_SUBST

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

function vcs_prompt_info {
    GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    GIT_ID=$(git rev-parse --short HEAD 2> /dev/null)
    HG_ID=$(hg id 2> /dev/null)

    if [[ -n $HG_ID ]]; then
        VCS='hg'
        VCS_INFO=$HG_ID
    elif [[ -n $GIT_ID ]]; then
        VCS='git'
        VCS_INFO="$GIT_ID $GIT_BRANCH"
    fi

    VCS_PROMPT_PREFIX="%{$fg_bold[blue]%}$VCS:(%{$fg[red]%}"
    VCS_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"

    echo "$VCS_PROMPT_PREFIX$VCS_INFO$VCS_PROMPT_SUFFIX"
}

PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} '
RPROMPT='$(vcs_prompt_info)'
