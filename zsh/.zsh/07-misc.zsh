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

# fzf completion
sourceif ~/.fzf.zsh

# source plugins
sourceif $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
sourceif $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh"  ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# source pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
