dotfiles
========

Personalised dotfiles.

### Setup

Running `make install` command will download `homebrew` to further install `vim`, `tmux` and `zshell` configurations.

The configurations are installed based on symbolic links. Whenever you clone this repo and install it, the configuration files will me mapped into your home, but the real source will remain on the directoy you cloned it. The reason behind it is that any change on these configs can be further versioned on git without messing around with your home directory.

```
$ make install
```

### Other options

```
make brew.install     # install homebrew
make brew.bundle      # install Homebrew packages from brew/Brewfile
make brew.dump        # creates a Brewfile from all the existing Homebrew packages you have installed with
make vim.install      # install vim with custom plugins
make tmux.install     # install tmux with custom plugins
make zshell.install   # install zshell
make vscode.bundle    # install vscode extensions and configs
make vscode.dump      # creates a file from all the existing VSCode extensions you have installed with
make iterm2.configure # configure iterm2

make uninstall        # uninstall everything, except homebrew
make vim.uninstall    # unlink and remove .vimrc and plugins
make tmux.uninstall   # unlink and remove tmux plugins
make zshell.uninstall # unlink .zshrc and remove zshell
```
