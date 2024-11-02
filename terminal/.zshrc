# -- ZSH Configuration --
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# --  homebrew --
# Needs to be done before sourcing oh-my-posh and others
if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# -- pipx --
export PATH="$PATH:/home/bwrob/.local/bin"
autoload -U compinit && compinit
eval "$(register-python-argcomplete pipx)"

# -- oh-my-posh --
OH_MY_POSH=$(brew --prefix oh-my-posh)
OH_MY_POSH_THEME="slim"
eval "$(oh-my-posh init zsh --config $OH_MY_POSH/themes/$OH_MY_POSH_THEME.omp.json)"

# -- zsh-autosuggestions --
AUTOSUGGESTIONS=$(brew --prefix zsh-autosuggestions)
source "$AUTOSUGGESTIONS/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# -- zsh-syntax-highlighting --
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -- the-fuck
eval $(thefuck --alias)

# -- fzf --
source <(fzf --zsh)
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# -- zoxide --
eval "$(zoxide init zsh)"

# -- Custom ZSH Aliases --
source ~/.aliases.zsh

# -- ghcup-env --
[ -f ~/.ghcup/env ] && . ~/.ghcup/env # ghcup-env


# -- Fastfetch   --
fastfetch -c ~/.fastfetch_config.json

# -- Python project executes --
if [[ -f pyproject.toml ]]; then
    poetry_env_path="$(poetry env info --path)"
    if [[ -n "$poetry_env_path" ]]; then
        source "$poetry_env_path/bin/activate"
        echo "Poetry environment activated: $poetry_env_path"
    else
        echo "Poetry environment not found. Make sure Poetry is installed and the project is initialized."
    fi
fi
