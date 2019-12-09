#!/bin/bash

###
# Install homebrew
###
install()
{
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

###
# Install Homebrew packages from brew/Brewfile
###
bundle()
{
  brew bundle --file=homebrew/Brewfile
}

###
# Creates a Brewfile from all the existing Homebrew packages you have installed
# with
###
dump()
{
  brew bundle dump --file=homebrew/Brewfile -f
}

###
# Setup fzf key bindings
###
setup_fzf()
{
  sh ./fzf-key-bindings.install.sh
}

$*
