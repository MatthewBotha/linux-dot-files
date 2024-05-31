{ config, pkgs, inputs, ... }:

{
    home.username = "lemonsir";
    home.homeDirectory = "/home/lemonsir";

    # user specific packages
    home.packages = with pkgs; [
        zsh
    ];

    # git config
    programs.git = {
        enable = true;
        userName = "MatthewBotha";
        userEmail = "m.botha41@gmail.com";
    };

    # tpm
    home.file = {
        ".tmux/plugins/tpm".source = inputs.tpm;
    };

    # State version
    home.stateVersion = "23.11";

    # Let Home Manager install and manager itsef
    programs.home-manager.enable = true;
}
