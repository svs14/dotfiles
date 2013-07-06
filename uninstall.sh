#!/bin/bash
#
# Removes env-custom
#
# Handles this by replacing env custom specified ~/ dot files
# with backed up copy.
# 
# Shell rc files have env-custom details removed.
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

# If not installed, exit
if [ ! -d "$old_dotfiles_home" ]; then
    echo "Environment not installed. Run install.sh to install." 1>&2
    exit 1
fi

### Copy files found in backup back to home directory
### then remove backup directory

# For each file found in backup
for file in $(find $old_dotfiles_home/ -maxdepth 1 -type f -or -type l); do

    # Retrieve base filename
    filename="$(basename $file)"

    # Copy file back to home directory
    rm ~/$filename # Necessary, so that cp does not follow through dest symlink
    cp -df $file ~/$filename

done

# Remove .old-home backup directory
rm -rf $old_dotfiles_home

### Remove env-custom details from shell rc files ###

# Clear env custom lines for bash
if [ -f ~/.bashrc ]; then
    sed -i '/^: ENV_CUSTOM/d' ~/.bashrc
fi

# Clear env custom lines for zsh
if [ -f ~/.zshrc ]; then
    sed -i '/^: ENV_CUSTOM/d' ~/.zshrc
fi

# Print completion message
echo "Uninstallation complete. Restart or source the rc of your shell to take
effect."
