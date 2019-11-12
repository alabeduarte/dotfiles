#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --file=brew/Brewfile
sh ./fzf-key-bindings.install.sh
