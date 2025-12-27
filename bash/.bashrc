#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\n\[\e[1;1m\]\u \w\[\e[0m\]\n'

# append to the history file, don't overwrite it
shopt -s histappend

# Setting up zoxide as 'cd'
eval "$(zoxide init bash --cmd cd)"

# fzf integration
eval "$(fzf --bash)"
source "$HOME/.config/fzf/fzf.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# prevents C-d to exit the terminal
export IGNOREEOF=10

/usr/bin/fastfetch

# sourcing .config/bash
for file in "$HOME"/.config/bash/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
