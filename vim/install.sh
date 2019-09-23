#!/bin/bash

# Creates symbolic link
rm -rf ~/.vimrc
ln -s `pwd`/.vimrc ~/.vimrc

# Setup neovim
rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim

cat <<EOT >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
