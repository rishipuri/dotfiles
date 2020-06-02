source $HOME/.zsh/01-exports.zsh

# Autostart X at login
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
