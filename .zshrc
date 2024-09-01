# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
# End of lines configured by zsh-newuser-install

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Initialize Homebrew
# Needs to be done before sourcing oh-my-posh and others
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Enable zsh-autosuggestions
AUTOSUGGESTIONS=$(brew --prefix zsh-autosuggestions)
source "$AUTOSUGGESTIONS/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Enable oh-my-posh
OH_MY_POSH=$(brew --prefix oh-my-posh)
OH_MY_POSH_THEME="slim"
eval "$(oh-my-posh init zsh --config $OH_MY_POSH/themes/$OH_MY_POSH_THEME.omp.json)"

# Created by `pipx` on 2024-08-16 15:35:30
export PATH="$PATH:/home/bwrob/.local/bin"
autoload -U compinit && compinit
eval "$(register-python-argcomplete pipx)"

# Aliases
source ~/.aliases.zsh
