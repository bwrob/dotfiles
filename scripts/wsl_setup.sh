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

# Install Haskell
echo "--- Installing Haskell ---"
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
cabal install stylish-haskell

# Install Python
echo "--- Installing Python setup ---"
brew install python3
python3 --version

brew install pipx
pipx ensurepath

pipx install argcomplete --force
echo 'autoload -U compinit && compinit' >> ~/.zshrc
echo 'eval "$(register-python-argcomplete pipx)"' >> ~/.zshrc

pipx install poetry poethepoet pre-commit pytest ruff basedpyright hapless

# Install Quarto
echo "--- Installing Quarto ---"
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.5.57/quarto-1.5.57-linux-amd64.tar.gz
mkdir ~/.local/share/quarto
tar -C ~/.local/share/quarto -xvzf quarto-1.5.57-linux-amd64.tar.gz
ln -s ~/.local/share/quarto/quarto-1.5.57/bin/quarto ~/.local/bin/quarto
quarto install tinytex
quarto install chromium
quarto check

# Install other tools
echo "--- Installing other tools ---"
brew install \
    bat \
    cmake \
    fzf \
    neovim \
    fastfetch  \
    oh-my-posh \
    thefuck \
    tmux \
    zoxide \
    zsh-autosuggestions \
    zsh-syntax-highlighting
