{ nodeEnv, fetchurl, ... }:
let
    sources = {

    };
in
{
    "@salesforce/cli" = nodeEnv.buildNodePackage {
        name = "sf";
        packagename = "@salesforce/cli";
        version = "2.45.6";
        src = fetchurl {
            url = "";
            sha512 = "";
        };
        dependencies = [
        ];
    };
}
