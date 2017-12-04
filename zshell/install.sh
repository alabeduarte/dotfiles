#!/bin/bash

# Downloads oh my zshell
curl -L http://install.ohmyz.sh | sh

git clone https://github.com/bhilburn/powerlevel9k.git \
  ~/.oh-my-zsh/custom/themes/powerlevel9k

# Creates symbolic link
rm ~/.zshrc || true
ln -s `pwd`/.zshrc ~/.zshrc
