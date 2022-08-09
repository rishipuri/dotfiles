[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xwallpaper --zoom ~/Pictures/wallpaper.png

if [ -x "`which vmware-user`" ]; then vmware-user; fi

exec i3
