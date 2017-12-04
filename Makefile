install: install_vim install_tmux install_zshell

uninstall: uninstall_vim uninstall_tmux uninstall_zshell

install_vim:
	@sh ./vim/install.sh

uninstall_vim:
	@sh ./vim/uninstall.sh

install_tmux:
	@sh ./tmux/install.sh

uninstall_tmux:
	@sh ./tmux/uninstall.sh

install_zshell:
	@sh ./zshell/install.sh

uninstall_zshell:
	@sh ./zshell/uninstall.sh

.PHONY: install, install_vim, install_tmux, install_zshell, uninstall, \
	uninstall_vim, uninstall_tmux, uninstall_zshell
