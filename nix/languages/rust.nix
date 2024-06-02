{ pkgs, ... }: {
    environment = {
        systemPackages = with pkgs; [
            cargo
            rustc
            rustfmt
            pre-commit
            rustPackages.clippy
        ];
    };
}
