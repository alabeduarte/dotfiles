#!/bin/bash

# Install tmux
brew install tmux

# Creates symbolic link
ln -s `pwd`/.tmux.conf ~/.tmux.conf

# Add dev-tmux as a command
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
chmod +x `pwd`/tmux/dev-tmux.sh

rm -rf /usr/local/bin/dev-tmux || true
ln -s `pwd`/tmux/dev-tmux.sh /usr/local/bin/dev-tmux
