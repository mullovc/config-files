export LIBVA_DRIVER_NAME=iHD
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xrdb -load ~/.Xresources

exec /usr/bin/i3
