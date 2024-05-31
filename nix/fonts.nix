{ pkgs, ... }:
{
    # Fonts
    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = ["FiraCode"]; })
        (google-fonts.override { fonts = ["DMMono"]; })
    ];
}
