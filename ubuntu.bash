#!/bin/bash

# Package manager stuff
sudo apt update
sudo apt install build-essential cmake stow

# .dotfiles
mv ~/.bashrc ~/.bashrc-org
stow bash nvim tmux fzf dircolors git

# Neovim
git clone https://github.com/neovim/neovim -b stable --depth 1 ~/navraj/neovim
cd ~/navraj/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd -

# Neovim plugin manager
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim --depth 1
nvim --headless -c 'autocmd User PackerCompelete quitall' -c 'PackerSync'

# Fzf
git clone https://github.com/junegunn/fzf.git ~/navraj/fzf --depth 1
~/navraj/fzf/install

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sudo sh

source ~/.bashrc
rm -rf ~/navraj
