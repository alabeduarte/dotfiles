#!/bin/bash

# Downloads oh my zshell
curl -L http://install.ohmyz.sh | sh

# Creates symbolic link
rm ~/.zshrc
ln -s `pwd`/.zshrc ~/.zshrc
