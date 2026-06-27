[[ $- != *i* ]] && return

export PS1='\[\e[1;34m\]\W \[\e[1;36m\]› \[\e[0m\]'

if FZF_PATH="$(command -v fzf)"; [ -x "$FZF_PATH" ]; then
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
    export FZF_DEFAULT_OPTS="--border --prompt='❯ ' \
      --color='prompt:2,hl:6,hl+:6,pointer:1,marker:1,info:11'"
    eval "$("$FZF_PATH" --bash)"
fi

alias vim='nvim'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias dot='git --git-dir=$XDG_PROJECTS_DIR/dot.git --work-tree=$HOME'
