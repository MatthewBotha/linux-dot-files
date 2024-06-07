{ ... }: {
    home.username = "work";
    # home.homeDirectory = "/home/work";
    
    # import = [ ./common.nix ];

    # State version
    home.stateVersion = "23.11";

    # Let Home Manager install and manager itsef
    programs.home-manager.enable = true;
}
