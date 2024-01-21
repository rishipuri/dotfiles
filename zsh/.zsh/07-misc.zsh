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
sourceif ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
sourceif ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

export FZF_DEFAULT_OPTS='--height 40% --border --layout=reverse'
export FZF_DEFAULT_COMMAND='fd -H --type f --strip-cwd-prefix'

# ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
