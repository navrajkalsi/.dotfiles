#!/bin/bash

# Run after cloning .dotfiles, from .dotfiles
ORG_DIR=$(pwd);

# Package manager stuff
echo "\nInstalling Packages\n"
sudo apt update
sudo apt install build-essential cmake stow -y

# .dotfiles
echo "\nMoving .bashrc\n"
mv "$HOME/.bashrc "$HOME/.bashrc-org
echo "\nStowing configs\n"
stow bash nvim tmux fzf dircolors git

# Neovim
echo "\nInstalling Neovim\n"
git clone https://github.com/neovim/neovim -b stable --depth 1 "$HOME/navraj/neovim"
cd "$HOME/navraj/neovim"
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd "$ORG_DIR"

# Neovim plugin manager
echo "\nInstalling Neovim Plugin Manager\n"
git clone https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" --depth 1
nvim --headless -c 'autocmd User PackerCompelete quitall' -c 'PackerSync'

# Fzf
echo "\nInstalling Fzf\n"
git clone https://github.com/junegunn/fzf.git "$HOME/navraj/fzf" --depth 1
"$HOME/navraj/fzf/install"

# Zoxide
echo "\nInstalling Zoxide\n"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sudo sh

echo "\nSourcing new bashrc\n"
source "$HOME/.bashrc"

remove_dir="y"
read -p "Remove $HOME/navraj dir (Y/n): " remove_dir
remove_dir=${remove_dir..}

if [[ "$remove_dir" == "n" || "$remove_dir" == "no" ]]; then
    echo "\nSkipped removing $HOME/navraj\n"
else
    echo "\nRemoving $HOME/navraj\n"
    rm -rf $HOME/navraj
fi

echo "\nDone."
