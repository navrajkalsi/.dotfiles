# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\n\[\e[1;1m\]\u \w\[\e[0m\]\n'

# append to the history file, don't overwrite it
shopt -s histappend

alias ls='lsd'
alias vim='nvim'
alias vi='nvim'
alias ta='tmux attach'
alias td='tmux detach'
alias tls='tmux ls'
alias tks='tmux kill-server'
alias ts='tmux-sessionizer'
alias ll='ls -alF'
alias la='ls -A'
alias cat='bat'
alias c='clear'
alias snvim='sudo -E -s nvim'
alias rm='rm -i' # thank yourself later
alias grep='grep --color=auto'
alias bc='bluetoothctl'
alias nt='nmtui'

# Setting up zoxide as 'cd'
eval "$(zoxide init bash --cmd cd)"

# fzf integration
# Installed by cloning repo and executing install.sh
# Then manually moving the files in the new bin dir to ./local/bin cause it is on the path
eval "$(fzf --bash)"
source "$HOME/.config/fzf/fzf.bash"

/usr/bin/fastfetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# prevents C-d to exit the terminal
export IGNOREEOF=10

# readline bindings
bind -f ~/.inputrc

bind -m emacs -x '"\C-s": tmux-sessionizer'
bind -m vi-insert -x '"\C-s": tmux-sessionizer'
bind -m vi-command -x '"\C-s": tmux-sessionizer'
