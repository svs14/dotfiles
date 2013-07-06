#!/bin/bash
#
# Installs env-custom
#
# Backs up and then
# replaces ~ dot files with those found in env-custom/home
# 
# Shell rc files are appended with env-custom details
# such that it is sourced appropriately.
# 
# Vim is setup with Vundle, if it does not exist then it is installed.
#

### Set bash environment for script 

# Set bash to exit immediately on failure
set -e

# Set bash statements to return failure if any piped command within it fails
set -o pipefail

# Use this file's directory as current working directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

# Set old dotfiles home
old_dotfiles_home=./.old-home

# Set env custom dotfiles home
env_dotfiles_home=./home

# If already installed, exit
if [ -d "$old_dotfiles_home" ]; then
    echo "Environment already installed. Run uninstall.sh to uninstall." 1>&2
    exit 1
fi

### Do a backup of dot files to be replaced by env-custom's
### env-custom/home files, then replace

# For file found in env_custom/home directory
for file in $(find $env_dotfiles_home/ -maxdepth 1 -type l -or -type f); do

    # Retrieve base filename
    filename="$(basename $file)"

    # Create .old-home backup directory if not exists
    mkdir -p $old_dotfiles_home

    # Backup file with same filename found in home directory
    cp -d ~/$filename $old_dotfiles_home/ 2>/dev/null \
        || touch $old_dotfiles_home/$filename

    # Copy file to home directory based on type
    if [ -h "$file" ]; then
        ln -fs $(readlink -f $file) ~/$filename
    else
        cp -f $file ~/$filename
    fi

done

### Append env-custom details to shell rc files

# Build shell statements to enable env custom
source_env_custom_str=$( cat <<- EOF
: ENV_CUSTOM && export ENV_CUSTOM_DIR=$( pwd )
: ENV_CUSTOM && . \$ENV_CUSTOM_DIR/shell-settings/.shellrc
EOF
)

# Enable env-custom for bash
if [ -f ~/.bashrc ]; then
    echo "$source_env_custom_str" >> ~/.bashrc
fi

# Enable env-custom for zsh
if [ -f ~/.zshrc ]; then
    echo "$source_env_custom_str" >> ~/.zshrc
fi

### Setup vim

# If vundle does not exist
if [ ! -d ~/.vim/bundle ]; then

    # Install vundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    # Setup vundle in new bash shell (so it has updated changes)
    bash -ic 'vim +BundleInstall +qall'

fi

# Print completion message
echo "Installation complete. Restart or source the rc of your shell to take
effect."
