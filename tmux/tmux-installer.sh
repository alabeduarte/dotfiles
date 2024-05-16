#!/bin/bash

###
# Creates symbolic link
###
create_sym_link()
{
  rm -rf ~/.tmux.conf
  ln -s `pwd`/.tmux.conf ~/.tmux.conf
}

###
# Add dev-tmux as a command
###
add_dev_tmux_into_path()
{
  chmod +x `pwd`/tmux/dev-tmux.sh
  rm -rf /usr/local/bin/dev-tmux || true
  ln -s `pwd`/tmux/dev-tmux.sh /usr/local/bin/dev-tmux
}

###
# Install tmux plugins
###
install_tmux_plugins()
{
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

###
# Setup tmux
###
install()
{
  create_sym_link;
  add_dev_tmux_into_path;
  install_tmux_plugins;
}

###
# Uninstall tmux
###
uninstall()
{
  unlink ~/.tmux.conf
  rm -rf ~/.tmux/plugins/tpm /usr/local/bin/dev-tmux
}

$*
