install: install_vim install_zshell

uninstall:
	@sh ./vim/uninstall.sh
	@sh ./zshell/uninstall.sh

install_vim:
	@sh ./vim/install.sh

install_zshell:
	@sh ./zshell/install.sh

.PHONY: install, uninstall, install_vim, install_zshell
