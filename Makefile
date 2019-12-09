install: install.brew \
	bundle.brew \
	install.fzf \
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
	@sh ./homebrew/brew-installer.sh install

bundle.brew:
	@sh ./homebrew/brew-installer.sh bundle

install.fzf:
	@sh ./homebrew/brew-installer.sh setup_fzf

install.vim:
	@sh ./vim/vim-installer.sh install

install.tmux:
	@sh ./tmux/tmux-installer.sh install

install.zshell:
	@sh ./zshell/install.sh

install.git_config:
	@sh ./git-config/install.sh

install.vscode:
	@sh ./vscode/bundler.sh bundle

dump.vscode:
	@sh ./vscode/bundler.sh dump

dump.brew:
	@sh ./homebrew/brew-installer.sh dump

configure.iterm2:
	@sh ./iterm2/set_user_path.sh

uninstall.vim:
	@sh ./vim/vim-installer.sh uninstall

uninstall.tmux:
	@sh ./tmux/tmux-installer.sh uninstall

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
