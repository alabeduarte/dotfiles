# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

POWERLEVEL10K_MODE='awesome-fontconfig'
POWERLEVEL10K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"

POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(ssh dir newline vcs)
POWERLEVEL10K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL10K_SHORTEN_DIR_LENGTH=1
POWERLEVEL10K_SHORTEN_DELIMITER=""
POWERLEVEL10K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL10K_SHOW_CHANGESET=true
POWERLEVEL10K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)
POWERLEVEL10K_VCS_COMMIT_ICON='\uE729 '

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git jump zsh-completions)

# zsh-completions: reloading the completion
fpath=($ZSH/custom/plugins/zsh-completions/src $fpath)

source $ZSH/oh-my-zsh.sh

# Nvm
export NVM_DIR="$HOME/.nvm"

# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# Go
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Aliases
alias v="nvim"
alias l='exa -l'
alias make='gmake'
alias chrome-dev='open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/profile-folder-name'
alias diff='git --no-pager diff --color=auto --no-ext-diff --no-index'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

export PATH="/usr/local/sbin:$PATH"

export GPG_TTY=$(tty)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
