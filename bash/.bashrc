#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for using git branch name in prompt
source /usr/share/git/completion/git-prompt.sh

export PS1="\n\[\e[1;1m\]\u \w\$(__git_ps1 \" (%s)\")\[\e[0m\]\n"

# append to the history file, don't overwrite it
shopt -s histappend

# make ctrl+s avaliable for binding
stty -ixon

# Setting up zoxide as 'cd'
eval "$(zoxide init bash --cmd cd)"

# fzf integration
eval "$(fzf --bash)"
source "$HOME/.config/fzf/fzf.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# prevents C-d to exit the terminal on first try
export IGNOREEOF=1

export EDITOR=nvim

export PATH+=":$HOME/.local/scripts"

/usr/bin/fastfetch

# sourcing .config/bash
for file in "$HOME"/.config/bash/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
. "$HOME/.cargo/env"
