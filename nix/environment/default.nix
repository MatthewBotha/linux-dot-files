{ pkgs, ... }: {
    imports = [
        ./zsh.nix
    ];

    environment = {
        systemPackages = with pkgs; [
            # development tools
            git
            gh
            
            # programs
            firefox

            # utils
            curl
            fzf
            ripgrep
            wget
            zip
            unzip

            # zscaler utils
            patchelf
            binutils
            stdenv
            dpkg
            nix-index
            stdenv.cc

            # tools
            gcc
            #kitty
            wezterm

            # work
            dbeaver # will be dbeaver-bin in 24.05+
            docker
            globalprotect-openconnect
            # postman
            bruno # postman does not work
            slack
            # teams # has been removed as it is no longer supported 
            zoom-us
# work stuff
# slack
# teams
# dbeaver
# postman
# chrome?
# -- zscaler and citrix

        ];
    };
    
    virtualisation.docker.enable = true;
    
    # Set the default editor to neovim
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    # Install firefox.
    programs.firefox.enable = true;
}
