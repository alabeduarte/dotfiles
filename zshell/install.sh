#!/bin/bash

# Downloads oh my zshell
curl -L http://install.ohmyz.sh | sh

git clone git@github.com:bhilburn/powerlevel9k.git \
  ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone git@github.com:zsh-users/zsh-completions.git \
  ~/.oh-my-zsh/custom/plugins/zsh-completions

# Creates symbolic link
rm ~/.zshrc || true
ln -s `pwd`/.zshrc ~/.zshrc
