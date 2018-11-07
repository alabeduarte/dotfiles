dotfiles
========

Personalised dotfiles.

`.tmux.conf` powered by [@gtramontina](https://github.com/gtramontina) :+1:

### Setup

Running `make install` command will download `homebrew` to further install `vim`, `tmux` and `zshell` configurations.

The configurations are installed based on symbolic links. Whenever you clone this repo and install it, the configuration files will me mapped into your home, but the real source will remain on the directoy you cloned it. The reason behind it is that any change on these configs can be further versioned on git without messing around with your home directory.

```
$ make install
```

### Other options

```
make install_vim      # install vim with custom plugins
make install_tmux     # install tmux with custom plugins
make install_zshell   # install zshell

make uninstall        # uninstall everything, except homebrew
make uninstall_vim    # unlink and remove .vimrc and plugins
make uninstall_tmux   # unlink and remove tmux plugins
make uninstall_zshell # unlink .zshrc and remove zshell
```
