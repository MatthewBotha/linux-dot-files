{ pkgs, ... }: {
    imports = [
        ./zsh.nix
    ];

    environment = {
        systemPackages = with pkgs; [
            # development tools
            git
            gh
            
            # utils
            wget
            curl
            fzf
            zip
            unzip
            ripgrep
            
            # tools
            gcc
            #kitty
            wezterm
        ];
    };
    
    # Set the default editor to neovim
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    # Install firefox.
    programs.firefox.enable = true;
}
