{ pkgs, ... }: {
    environment.shells = with pkgs; [ zsh ];

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        histSize = 10000;

        ohMyZsh = {
            enable = true;
        };
    };

    # set as default shell
    users.defaultUserShell = pkgs.zsh;
}

