install:
	@curl -L http://install.ohmyz.sh | sh
	@rm ~/.zshrc
	@ln -s `pwd`/.zshrc ~/.zshrc

uninstall:
	@unlink ~/.zshrc
	@rm -rf ~/.oh-my-zsh

.PHONY: install, uninstall
