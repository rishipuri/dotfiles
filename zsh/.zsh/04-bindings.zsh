bindkey -v

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# search history on Up/Down keys
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# move through completion backwards using Shift-Tab key
bindkey "^[[Z" reverse-menu-complete
