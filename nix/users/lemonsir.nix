{ pkgs, ... }: {
    home.username = "lemonsir";
    home.homeDirectory = "/home/lemonsir";
    
    # imports = [ ./common.nix ];

    # user specific packages
    home.packages = with pkgs; [
        zsh
    ];
    
    # zsh config
    programs.zsh = {
        enable = true;
        # dotDir = ".config/zsh";
        localVariables = {
            XDG_CONFIG_HOME = "/home/lemonsir/.config";
            FLAKE_CONFIG_DIR = "$XDG_CONFIG_HOME/nix";
        };
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
