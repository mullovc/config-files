export PATH=$HOME/bin:$PATH

xrdb -load ~/.Xresources
urxvtd -q -o -f

exec /usr/bin/i3
