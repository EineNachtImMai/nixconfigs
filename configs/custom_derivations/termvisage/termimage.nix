{
  lib,
  fetchzip,
  pkgs,
  python3Packages,
  ...
}: let
  pillow = pkgs.callPackage ./pillow.nix {};
in
  python3Packages.buildPythonPackage rec {
    pname = "term_image";
    version = "0.6.2"; # You can specify the version or use "latest"
    format = "pyproject";

    src = fetchzip {
      inherit pname version;
      url = "https://files.pythonhosted.org/packages/59/7a/fddd8343b03390a7b6962f2d17e45987410ec43a1befc26b98509bada067/term_image-0.6.2.tar.gz";
      sha256 = "sha256-zepjC/taEF61LX+9KYeEcvTQ1fwPYSJiplQ9FLcygb4="; # You can get this hash by running `nix-prefetch-url <url>`
    };

    nativeBuildInputs = [python3Packages.setuptools pillow python3Packages.requests];

    meta = with lib; {
      description = "TermImage - a library for visualizing images in the terminal";
      license = licenses.mit;
    };
  }
