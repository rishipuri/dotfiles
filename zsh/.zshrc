for config (~/.zsh/*[1-7]*.zsh) source $config

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

typeset -aU path
