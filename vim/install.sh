#!/bin/bash

# Downloads Vundle for manage plugins dependencies
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Creates symbolic link
rm ~/.vimrc || true
ln -s `pwd`/.vimrc ~/.vimrc

# Installs vundle plugins
sh `pwd`/vim/vundle_plugin_install.sh

# Install nerd fonts
brew tap caskroom/fonts
brew cask install font-firacode-nerd-font
