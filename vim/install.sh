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
