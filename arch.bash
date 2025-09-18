#!/bin/bash

# Sudo access
if ! sudo true; then
    echo "Error: sudo"
    exit 1
fi

# Run after cloning .dotfiles, from .dotfiles
ORG_DIR=$(pwd);

# Package Manager
printf "\nInstalling Packages\n"
sudo pacman -Syu --noconfirm base-devel nvim cmake stow lsd zoxide tree fzf tmux fastfetch

# .dotfiles
printf "\nMoving .bashrc\n"
mv $HOME/.bashrc $HOME/.bashrc-org
printf "\nStowing configs\n"
stow bash nvim tmux fzf dircolors git

# Neovim plugin manager
printf "\nInstalling Neovim Plugin Manager\n"
git clone https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim --depth 1

printf "\nSourcing new bashrc\n"
source $HOME/.bashrc

read -p "Remove $HOME/navraj dir (Y/n): " remove_dir
remove_dir=${remove_dir,,}

if [[ "$remove_dir" == "n" || "$remove_dir" == "no" ]]; then
    printf "\nSkipped removing $HOME/navraj\n"
else
    printf "\nRemoving $HOME/navraj\n"
    rm -rf $HOME/navraj
fi

printf "\nDone.\n\n"
