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
