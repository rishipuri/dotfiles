[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xrandr --dpi 144
xwallpaper --zoom ~/Pictures/wallpaper.png

if [ -x "`which vmware-user`" ]; then vmware-user; fi

exec i3
