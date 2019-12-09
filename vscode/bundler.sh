#!/bin/bash

###
# Creates symbolic link from this dir into where vscode is installed
# then reads VSCodeExtensionsFile and install each extension one by one
###
bundle()
{
  echo "yay"

  # Creates symbolic link
  rm -rf ~/Library/Application\ Support/Code/User/settings.json || true
  ln -s `pwd`/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

  # Install extensions
  while read extension; do
    code --install-extension $extension
  done < vscode/VSCodeExtensionsFile

  echo "Done."
}

###
# List vscode extensions and place into VSCodeExtensionsFile file
###
dump()
{
  extensions="vscode/VSCodeExtensionsFile"
  echo "Reading existing extensions from VSCode onto $extensions"
  echo ""

  code --list-extensions | tee $extensions

  echo "Done."
}

$*
