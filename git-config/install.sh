#!/usr/bin/env bash
set -x

git config --global diff.compactionHeuristic true

echo 'Configuring better git log'
git config --global alias.l "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

echo 'Configure vim as global editor'
git config --global core.editor $(which nvim)

echo 'Auto sign commits'
git config --global commit.gpgsign true

echo 'Configure git aliases'
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.recent 'branch --sort=-committerdate --format="%(committerdate:relative)%09%(refname:short)"'
