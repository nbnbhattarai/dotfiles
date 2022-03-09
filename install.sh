#!/bin/bash

# This script is intended to be run upon setting up a new system in GH Codespaces
# To use locally, run ./install.sh local to skip copying dotfiles outside source control

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Patch agnoster theme with my preferred color scheme & path shrinking
sed -i 's/prompt_segment blue $CURRENT_FG '\''%~'\''/prompt_segment cyan $CURRENT_FG "$(shrink_path -f)"/g' ~/.oh-my-zsh/themes/agnoster.zsh-theme

# Copy dotfiles (unless running the local command)
$1 = local || cp -a home/. ~

# Fix SSH key permissions
chmod 600 ~/.ssh/id_rsa.pub ~/.ssh/id_rsa

# Install additional dependencies
# NVM
which nvm >/dev/null || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# Linux-specific installation
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt update
  sudo apt install git-crypt
  sudo apt install python3 python3-dev python3-pip python3-setuptools
  pip3 install thefuck --user
# MacOS-specific installation
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Install homebrew
  which brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install git-crypt
  brew install thefuck
fi

