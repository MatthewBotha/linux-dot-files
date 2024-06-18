{ stdenv, lib, autoPatchelfHook }:
stdenv.mkDerivation rec {
    pname = "Zscaler";
    version = "1.5.0.41";
    src = ./zscaler-64.run;
    phases = [ "installPhase" ];
    
    nativeBuildInputs = [ autoPatchelfHook ];

    installPhase = ''
        runHook preInstall
        ./zscaler.run --mode unattended --unattendedmodeui minimal --cloudName zscalertwo --userDomain mit.edu --hideAppUIOnLaunch 1 --policyToken 343835333A333A35346566383137332D633930362D343531302D623963372D353231613636333835363138
        runHook postInstall
    '';
}
