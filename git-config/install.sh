#!/usr/bin/env bash
set -x

git config --global diff.compactionHeuristic true

echo 'Configuring better git log'
git config --global alias.l "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

echo 'Configure vim as global editor'
git config --global core.editor $(which vim)

echo 'Configure git aliases'
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
