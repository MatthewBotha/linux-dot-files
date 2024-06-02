{ pkgs, ... }: {
    environment = {
        systemPackages = with pkgs; [
            pkgs.nodejs # We can set version e.g. pkgs.nodejs-19_x

            # typescript
            pkgs.nodePackages.typescript
        ];
    };
}
