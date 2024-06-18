{ pkgs, ... }: 
let
    extraNodePackages = import ../packages/node/default.nix {};
    extraPackages = import ../packages/zscaler/default.nix {};
in
{
    home.username = "lemonsir";
    home.homeDirectory = "/home/lemonsir";
    
    # imports = [ ./common.nix ];

    # user specific packages
    home.packages = [
        pkgs.fd

        extraNodePackages."@salesforce/cli"
        extraPackages.Zscaler
    ];

    # zsh config
    programs.zsh = {
        enable = true;
        initExtraFirst = ''
            # relative variables do not work in localVariables
            export XDG_CONFIG_HOME="''$HOME/.config"
            export FLAKE_CONFIG_DIR="''$XDG_CONFIG_HOME/nix"
            export PATH="''$HOME/cli/sf/bin:''$PATH"
        '';
        initExtra = ''
            # scripts
            for script in ~/.config/scripts/*.sh; do
                source "$script"
            done
        '';
        # oh-my-zsh config
        oh-my-zsh = {
            enable = true;
            theme = "random";
        };
    };

    # git config
    programs.git = {
        enable = true;
        userName = "MatthewBotha";
        userEmail = "m.botha41@gmail.com";
    };

    # State version
    home.stateVersion = "23.11";

    # Let Home Manager install and manager itsef
    programs.home-manager.enable = true;
}
