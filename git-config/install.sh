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

echo 'Setting up global gitignore'
GLOBAL_GITIGNORE="$HOME/.gitignore_global"

# Create global gitignore file
cat >"$GLOBAL_GITIGNORE" <<EOF
# Global gitignore for personal development environment

# AI Assistant context files
CLAUDE.md

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor temporary files
*~
.swp
.swo
*.tmp
EOF

# Configure git to use global gitignore
git config --global core.excludesfile "$GLOBAL_GITIGNORE"
echo "Global gitignore configured at $GLOBAL_GITIGNORE"
