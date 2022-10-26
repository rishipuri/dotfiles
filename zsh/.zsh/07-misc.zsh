# setopts
setopt NO_BEEP
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt MULTIOS
setopt INTERACTIVECOMMENTS
setopt GLOBDOTS

sourceif () {
    [ -f $1 ] && source $1
}

# source plugins
sourceif /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
sourceif /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source nvm
sourceif /usr/share/nvm/init-nvm.sh

# source pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rust env
sourceif "$HOME/.cargo/env"

# fzf
sourceif /usr/share/fzf/key-bindings.zsh
sourceif /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS='--height 40% --border'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
