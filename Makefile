install: install.brew install.vim install.tmux install.zshell install.git_config configure.iterm2

uninstall: uninstall.vim uninstall.tmux uninstall.zshell

install.brew:
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle --file=brew/Brewfile

install.vim:
	@sh ./vim/install.sh
	@brew install the_silver_searcher

install.tmux:
	@sh ./tmux/install.sh

install.zshell:
	@sh ./zshell/install.sh

install.git_config:
	@sh ./git-config/install.sh

configure.iterm2:
	@sh ./iterm2/set_user_path.sh

uninstall.vim:
	@sh ./vim/uninstall.sh

uninstall.tmux:
	@sh ./tmux/uninstall.sh

uninstall.zshell:
	@sh ./zshell/uninstall.sh

.PHONY: install, \
	install.brew, \
	install.vim, \
	install.tmux, \
	install.zshell, \
	install.git_config,	\
	configure.iterm2,	\
	uninstall, \
	uninstall.vim, \
	uninstall.tmux, \
	uninstall.zshell
