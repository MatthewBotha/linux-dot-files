{ pkgs, ... }:
{
    environment.systemPackages =
        let
            salesforce-cli = with pkgs; stdenv.mkDerivation rec {
                owner = "salesforcecli";
                pname = "cli";
                version = "2.44.8";
                hash = "";

                src = fetchFromGithub {
                    owner = owner;
                    repo = pname;
                    rev = "v${version}";
                    hash = hash;
                };
            };
        in
        [ salesforce-cli ];
}
