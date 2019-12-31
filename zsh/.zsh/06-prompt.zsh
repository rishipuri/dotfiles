# prompt
autoload -Uz colors
colors

setopt PROMPT_SUBST

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

# todo: git/hg RPROMPT
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} '
