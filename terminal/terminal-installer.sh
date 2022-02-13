#!/bin/bash

###
# Install
###
install()
{
  config_dir=`pwd`/.kitty.conf
  echo "export KITTY_CONFIG_DIRECTORY=\"$config_dir\"" >> ~/.zshrc
}

###
# Uninstall
###
uninstall()
{
  echo "to unset kitty config, unset KITTY_CONFIG_DIRECTORY and remove it from ~/.zshrc"
}

$*
