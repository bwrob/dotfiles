#!/bin/bash

# This script is a quick and dirty hack to get Linux in Windows and WSL. It's not meant to be a full setup.
# I just wanted to get some experience with WSL and Homebrew.
sudo apt-get upgrade -y && sudo apt-get install build-essential git -y

# Install Homebrew
echo "--- Installing Homebrew ---"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew doctor
echo 'export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"' >> ~/.profile

# Install ZSH
brew install zsh
zsh --version
zsh

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bwrob/.zshrc
echo $SHELL &&  sudo chsh -s $(which zsh) &&  echo $SHELL

# Install GitHub CLI
echo "--- Installing GitHub CLI ---"
brew install gh
gh auth login

# Install Rust
echo "--- Installing Rust ---"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
