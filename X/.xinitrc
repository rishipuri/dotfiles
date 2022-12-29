[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr --dpi 144
xwallpaper --zoom ~/Pictures/wallpaper.png

if [ -x "`which vmware-user`" ]; then vmware-user; fi

exec i3
