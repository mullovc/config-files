#
# ~/.bash_profile
#
export PATH=$HOME/bin:$PATH
export VISUAL=/usr/bin/nvim

if [[ ! $DISPLAY && $XDG_VTNR == 1 ]];
then
    export QT_QPA_PLATFORM=wayland

    exec sway
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
