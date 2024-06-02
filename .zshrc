# environment variables
export ZSH_TMUX_AUTOSTART=true # start tmux automatically
export XDG_CONFIG_HOME="/home/lemonsir/.config"
export FLAKE_CONFIG_DIR="$XDG_CONFIG_HOME/nix"

# aliases
alias tmux="tmux -2"

# scripts
for script in ~/.config/scripts/*.sh; do
    source "$script"
done
