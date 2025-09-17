#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\n\[\e[1;1m\]\u \w\[\e[0m\]\n'

# append to the history file, don't overwrite it
shopt -s histappend

alias ls='lsd'
alias vim='nvim'
alias ta='tmux attach'
alias td='tmux detach'
alias tls='tmux ls'
alias ll='ls -alF'
alias la='ls -A'
alias cat='bat'
alias snvim='sudo -E -s nvim'

# Setting up zoxide as 'cd'
eval "$(zoxide init bash --cmd cd)"

# fzf integration
# Installed by cloning repo and executing install.sh
# Then manually moving the files in the new bin dir to ./local/bin cause it is on the path
eval "$(fzf --bash)"
source "$HOME/.config/fzf/fzf.bash"

/usr/bin/fastfetch
