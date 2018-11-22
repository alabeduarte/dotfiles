install: install_brew install_vim install_tmux install_zshell install_git_config

uninstall: uninstall_vim uninstall_tmux uninstall_zshell

install_brew:
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle --file=brew/Brewfile

install_vim:
	@sh ./vim/install.sh
	@brew install the_silver_searcher

install_tmux:
	@sh ./tmux/install.sh

install_zshell:
	@sh ./zshell/install.sh

install_git_config:
	@sh ./git-config/install.sh

uninstall_vim:
	@sh ./vim/uninstall.sh

uninstall_tmux:
	@sh ./tmux/uninstall.sh

uninstall_zshell:
	@sh ./zshell/uninstall.sh

.PHONY: install, \
	install_brew, \
	install_vim, \
	install_tmux, \
	install_zshell, \
	install_git_config,	\
	uninstall, \
	uninstall_vim, \
	uninstall_tmux, \
	uninstall_zshell
