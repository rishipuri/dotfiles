bindkey -v

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# search history on up/down keys
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search
