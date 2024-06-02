{ pkgs, ... }: {
    environment = {
        systemPackages = with pkgs; [
            zsh
            tmux
        ];
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
}

