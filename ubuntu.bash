#!/bin/bash

# Run after cloning .dotfiles, from .dotfiles
ORG_DIR=$(pwd);

# Package manager stuff
printf "\nInstalling Packages\n"
sudo apt update
sudo apt install build-essential cmake stow -y lsd

# .dotfiles
printf "\nMoving .bashrc\n"
mv $HOME/.bashrc $HOME/.bashrc-org
printf "\nStowing configs\n"
stow bash nvim tmux fzf dircolors git

# Neovim
printf "\nInstalling Neovim\n"
git clone https://github.com/neovim/neovim -b stable --depth 1 $HOME/navraj/neovim
cd $HOME/navraj/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd $ORG_DIR

# Neovim plugin manager
printf "\nInstalling Neovim Plugin Manager\n"
git clone https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim --depth 1

# Fzf
printf "\nInstalling Fzf\n"
git clone https://github.com/junegunn/fzf.git $HOME/navraj/fzf --depth 1
sudo mv $HOME/navraj/fzf/bin/* /usr/local/bin
sudo mkdir -p /usr/local/share/man/man1 && sudo mv $HOME/navraj/fzf/man/man1/* /usr/local/share/man/man1
# $HOME/navraj/fzf/install

# Zoxide
printf "\nInstalling Zoxide\n"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo mv $HOME/.local/bin/zoxide /usr/local/bin
sudo mkdir -p /usr/local/share/man/man1 && sudo mv $HOME/.local/share/man/man1/* /usr/local/share/man/man1

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
