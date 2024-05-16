#!/bin/bash

###
# Install
###

install()
{
  # Downloads oh my zshell
  curl -L http://install.ohmyz.sh | sh

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  git clone https://github.com/zsh-users/zsh-completions.git \
    ~/.oh-my-zsh/custom/plugins/zsh-completions

  # Creates symbolic link
  rm ~/.zshrc || true
  ln -s `pwd`/.zshrc ~/.zshrc
}

uninstall()
{
  unlink ~/.zshrc
  rm -rf ~/.oh-my-zsh
}

$*
