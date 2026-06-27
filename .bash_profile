export EDITOR=nvim

[[ -z $WAYLAND_DISPLAY && $(tty) = /dev/tty1 ]] && exec sway --unsupported-gpu
[[ -f ~/.bashrc ]] && . ~/.bashrc
