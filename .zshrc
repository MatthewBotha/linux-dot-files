# environment variables
export ZSH_TMUX_AUTOSTART=true # start tmux automatically
export XDG_CONFIG_HOME="/home/lemonsir/.config"
export FLAKE_CONFIG_DIR="$XDG_CONFIG_HOME/nix"

# scripts
for script in ~/.config/scripts/*.sh; do
    source "$script"
done

# theme
ZSH_THEME="random"
