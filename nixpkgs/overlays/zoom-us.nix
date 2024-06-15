{ ... }: {
    # zoom
    # nixpkgs.overlays = [(final: prev: {
    #     zoom-us = prev.zoom-us.overrideAttrs (old: rec {
    #         version = "6.0.12.5501"; # version retrieved from https://zoom.us/download
    #         src = prev.fetchurl {
    #             url = "https://zoom.us/client/${version}/zoom_x86_64.pkg.tar.xz";
    #             hash = "";
    #         };
    #     });
    # })];
}
