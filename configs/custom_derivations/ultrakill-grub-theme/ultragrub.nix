{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}: let
  version = "1.0.0";
in
  stdenvNoCC.mkDerivation {
    pname = "ultragrub";
    inherit version;

    src = fetchFromGitHub {
      owner = "YouStones";
      repo = "ultrakill-grub-theme";
      rev = "6df32df10aaa79c14d39775d5a5e44416fcb7078";
      hash = "sha256-PgQu1m7H11O8QveVvnofdZDqfs08mJqTMsaJk9Th+GQ=";
    };
    installPhase = ''
      runHook preInstall

      mkdir -p $out/
      cp -r ./* "$out/"

      runHook postInstall
    '';

    meta = {
      description = "UltraGRUB";
      homepage = "https://github.com/YouStones/ultrakill-grub-theme";
      license = lib.licenses.mit;
      platforms = lib.platforms.linux;
    };
  }
