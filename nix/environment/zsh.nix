{ pkgs, ... }: {
    environment.shells = with pkgs; [ zsh ];

    programs.tmux = {
        enable = true;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            tmux = "tmux -2";
        };

        histSize = 10000;

        ohMyZsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [
                "tmux"
            ];
        };
    };

    # set as default shell
    users.defaultUserShell = pkgs.zsh;
}

