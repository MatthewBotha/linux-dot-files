{ pkgs, ... }: {
    environment = {
        systemPackages = with pkgs; [
            nodejs # We can set version e.g. pkgs.nodejs-19_x

            # typescript
            nodePackages.typescript
        ];
    };
}
