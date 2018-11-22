# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir rbenv nvm newline vcs)
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"

POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)
POWERLEVEL9K_VCS_COMMIT_ICON='\uE729 '

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git jump)

source $ZSH/oh-my-zsh.sh

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export TERM=xterm-256color
export PATH="$HOME/.jenv/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
if [ -r .nvmrc ]; then
  version=`cat .nvmrc`
  echo "[ Using Node v$version ]"
  nvm use $version
fi

alias v="vim"
alias l='exa -l'
alias make='gmake'
alias chrome-dev='open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/profile-folder-name'
alias diff='git --no-pager diff --color=auto --no-ext-diff --no-index'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
