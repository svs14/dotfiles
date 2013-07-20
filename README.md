## Overview

My personal *dotfiles*, internally known as *env_custom*, is a collection of
dotfiles and install scripts for use on \*unix machines.

## Requirements

The following must be installed:

* bash
* curl
* git
* vim

## Getting Started

Installation requires these steps:

    git clone https://github.com/sjenkz/dotfiles.git .env_custom
    .env_custom/install.sh

This will:

* Add a line to your shell (zsh/bash) rc file, sourcing
the *env_custom*'s `shell-settings/.shellrc` script, that enables
custom shell configurations.
* Backup (`.old-home/`) files that are to be overriden in home
directory by files found in `home/`.
* Install vundle if required for vim.


If you find *env_custom* disagreeable, then you can uninstall by:

    .env_custom/uninstall.sh

This will revert back to your old setup as found in the backup `.old-home/`.

Various install scripts are scattered throughout the *env_custom* main directory,
such as `ruby/install-rvm.sh`. These can be called directly from your shell.

## How It Works

When *env_custom* is installed, it sources `shell-settings/.shellrc` from the 
provided shell's rc file. This in turn sources non-hidden files in 
`shell-settings/` for any shell, and sources non-hidden files found in the 
shell's directory `shell-setting/[shell-name]`.

Files found in `home/`, are copied to `~/`. These files are often symbolic links
that point to rc files in their respective topic directory. For example,
`home/.vimrc` points to `vim/.vimrc`.

The file `vim/.vimrc`, is Vundle-enabled and modularised such that it sources
from 'facets' (files found of form `vim/facets/*.vim`).

Install scripts that can be run by bash can be found in topic directories for
common tasks such as installing rvm when developing in ruby
(`ruby/install-rvm.sh`).

## License

MIT License. See [LICENSE.txt](LICENSE.txt) for more details.
