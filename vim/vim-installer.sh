#!/bin/bash

###
# Creates symbolic link
###
create_sym_link()
{
  rm -rf ~/.vimrc
  ln -s `pwd`/.vimrc ~/.vimrc
}

###
# Setup neovim
###
setup_neovim()
{
  rm -rf ~/.config/nvim
  mkdir -p ~/.config/nvim
}

###
# Install
###
install()
{
  create_sym_link;
  setup_neovim;

cat <<EOT >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT
}

###
# Uninstall
###
uninstall()
{
  unlink ~/.vimrc
  rm -rf ~/.vim/bundle/Vundle.vim
}

$*
