#!/bin/bash

create_sym_link() {
  # Remove existing file/dir/symlink
  rm -rf ~/.config/nvim
  ln -s "$(pwd)/nvim" ~/.config/nvim
}

setup_neovim() {
  create_sym_link
}

install() {
  setup_neovim
}

uninstall() {
  if [ -L ~/.config/nvim ] || [ -d ~/.config/nvim ]; then
    rm -rf ~/.config/nvim
  fi
}

$*
