install: install.brew \
	install.vim \
	install.tmux \
	install.zshell \
	install.git_config \
	install.vscode \
	configure.iterm2

uninstall: uninstall.vim \
	uninstall.tmux \
	uninstall.zshell

install.brew:
	@sh ./homebrew/install.sh

install.vim:
	@sh ./vim/vim-installer.sh install

install.tmux:
	@sh ./tmux/install.sh

install.zshell:
	@sh ./zshell/install.sh

install.git_config:
	@sh ./git-config/install.sh

install.vscode:
	@sh ./vscode/bundler.sh bundle

dump.vscode:
	@sh ./vscode/bundler.sh dump

dump.brew:
	@brew bundle dump --file=homebrew/Brewfile -f

configure.iterm2:
	@sh ./iterm2/set_user_path.sh

uninstall.vim:
	@sh ./vim/vim-installer.sh uninstall

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
	install.vscode, \
	dump.vscode, \
	dump.brew, \
	configure.iterm2,	\
	uninstall, \
	uninstall.vim, \
	uninstall.tmux, \
	uninstall.zshell
