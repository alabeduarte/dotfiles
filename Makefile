install: brew.install \
	brew.bundle \
	fzf.install \
	vim.install \
	tmux.install \
	zshell.install \
	git_config.install \
	terminal.install \
	vscode.bundle

uninstall: vim.uninstall \
	tmux.uninstall \
	zshell.uninstall \
	terminal.uninstall

brew.install:
	@sh ./homebrew/brew-installer.sh install

brew.bundle:
	@sh ./homebrew/brew-installer.sh bundle

brew.dump:
	@sh ./homebrew/brew-installer.sh dump

fzf.install:
	@sh ./homebrew/brew-installer.sh setup_fzf

vim.install:
	@sh ./vim/vim-installer.sh install

vim.uninstall:
	@sh ./vim/vim-installer.sh uninstall

tmux.install:
	@sh ./tmux/tmux-installer.sh install

tmux.uninstall:
	@sh ./tmux/tmux-installer.sh uninstall

zshell.install:
	@sh ./zshell/zshell-installer.sh install

zshell.uninstall:
	@sh ./zshell/zshell-installer.sh uninstall

git_config.install:
	@sh ./git-config/install.sh

vscode.bundle:
	@sh ./vscode/bundler.sh bundle

vscode.dump:
	@sh ./vscode/bundler.sh dump

terminal.install:
	@sh ./terminal/terminal-installer.sh install

terminal.uninstall:
	@sh ./terminal/terminal-installer.sh uninstall

.PHONY: install, \
	brew.install, \
	brew.bundle \
	brew.dump \
	fzf.install \
	vim.install \
	vim.uninstall \
	tmux.install \
	tmux.uninstall \
	zshell.install \
	zshell.uninstall \
	git_config.install \
	vscode.bundle \
	vscode.dump \
	terminal.install \
	terminal.uninstall
