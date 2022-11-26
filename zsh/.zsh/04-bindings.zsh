bindkey -v

bindkey "^A" beginning-of-line
bindkey "^[[1~" beginning-of-line

bindkey "^E" end-of-line
bindkey "^[[4~" end-of-line

bindkey "^F" forward-word
bindkey "^[[1;5C" forward-word

bindkey "^B" backward-word
bindkey "^[[1;5D" backward-word

# search history on Up/Down keys
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[5~" up-line-or-beginning-search

bindkey "^[[B" down-line-or-beginning-search
bindkey "^[[6~" down-line-or-beginning-search

# move through completion backwards using Shift-Tab key
bindkey "^[[Z" reverse-menu-complete

# delete backward with Backspace
bindkey "^?" backward-delete-char

# delete forward with Delete
bindkey "^[[3~" delete-char
