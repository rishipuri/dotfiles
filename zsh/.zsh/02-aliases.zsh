alias vi='vim'

alias zshrc='vi ~/.zshrc'
alias srczshrc='source ~/.zshrc'

alias bashrc='vi ~/.bashrc'
alias srcbashrc='source ~/.bashrc'

alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias hgid='hg identify'
alias hgup='hg update'
alias hgst='hg status'
alias hgrev='hg revert'
alias hgi='hg incoming | more'
alias hgim='hg incoming mainline | more'
alias hgl='hg pull'
alias hglm='hg pull mainline'
alias hgo='hg outgoing'
alias hgd='hg diff'
alias hgsl='hg log --limit 20 --template "{node|short} \
    | {date|isodatesec} \
    | {pad(author|user, 10)}: {desc|strip|firstline}\n"'

alias tmuxi='tmuxinator'