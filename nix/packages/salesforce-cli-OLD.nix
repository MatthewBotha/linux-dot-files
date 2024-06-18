{ pkgs, ... }:
{
    environment.systemPackages =
        let
            sf = with pkgs; stdenv.mkDerivation rec {
                name = "sf";
                # owner = "salesforcecli";
                # pname = "cli";
                version = "2.44.8";
                # hash = "sha256-zg/uWaIdM/huSKMtVy8XnHpVkiimwJfqYqI2xiT9uu4=";
                
                src = fetchurl {
                    url = "https://developer.salesforce.com/media/salesforce-cli/sf/channels/stable/sf-linux-x64.tar.xz";
                    hash = "sha256-fwWOF9wyjP4SqY1ZMz/r11G6BVyq0KkIadC4j4h0Ci4=";
                };
                # src = fetchFromGitHub {
                #     owner = "salesforcecli";
                #     repo = "cli";
                #     rev = version;
                #     hash = "sha256-zg/uWaIdM/huSKMtVy8XnHpVkiimwJfqYqI2xiT9uu4=";
                # };
                # phases = ["unpackPhase" "configurePhase" "buildPhase" "installPhase" "distPhase"];
                
                builder = builtins.toFile "builder.sh" ''
                    mkdir -p "$HOME/cli/sf"
                    tar xJf sf-linux-x64.tar.xz -C "$HOME/cli/sf" --strip-components 1
                    export PATH="$HOME/cli/sf/bin:$PATH"
                '';
            };
        in
        [ sf ];
}
