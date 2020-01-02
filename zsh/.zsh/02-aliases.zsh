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
alias hgc='hg commit'
alias hgcm='hg commit --amend'
alias hgrev='hg revert'
alias hgi='hg incoming | more'
alias hgim='hg incoming mainline | more'
alias hgl='hg pull'
alias hglm='hg pull mainline'
alias hgo='hg outgoing'
alias hgp='hg push'
alias hgd='hg diff'
alias hgsl='hg log --limit 20 --template "{node|short} \
    | {date|isodatesec} \
    | {pad(author|user, 10)}: {desc|strip|firstline}\n"'

alias gst='git status'
alias ga='git add'
alias gc='git commit --verbose'
alias gcm='git commit --amend'
alias gd='git diff'
alias gp='git push'
alias gl='git pull'
alias gf='git fetch'
alias gsl='git log --oneline --max-count=20'

alias tmuxi='tmuxinator'
