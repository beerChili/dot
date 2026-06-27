export EDITOR=nvim
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[[ -z $WAYLAND_DISPLAY && $(tty) = /dev/tty1 ]] && exec sway --unsupported-gpu
[[ -f ~/.bashrc ]] && . ~/.bashrc
