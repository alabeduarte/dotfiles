#!/bin/bash

###
# Creates symbolic link
###
create_sym_link() {
  #rm -rf ~/.vimrc
  #ln -s `pwd`/.vimrc ~/.vimrc
  ln -s $(pwd)/nvim ~/.config/nvim
}

###
# Setup neovim
###
setup_neovim() {
  rm -rf ~/.config/nvim
  mkdir -p ~/.config/nvim
}

###
# Install
###
install() {
  setup_neovim
  create_sym_link
}

###
# Uninstall
###
uninstall() {
  unlink ~/.config/nvim
}

$*
