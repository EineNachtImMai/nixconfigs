{
  lib,
  fetchPypi,
  python3Packages,
  ...
}: let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-24.05.tar.gz";
    sha256 = "0zydsqiaz8qi4zd63zsb2gij2p614cgkcaisnk11wjy3nmiq0x1s";
  }) {};
  pillow = pkgs.callPackage ./pillow.nix {};
  term_image = pkgs.callPackage ./termimage.nix {};
in
  python3Packages.buildPythonPackage rec {
    pname = "termvisage";
    version = "0.2.0"; # You can specify the version or use "latest"
    format = "pyproject";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-3zp9DeemYQxCLIIJ0ie9ZT9DWgYVdmYtDuQ/Nl3HTH8="; # You can get this hash by running `nix-prefetch-url <url>`
    };

    buildInputs = [python3Packages.pip python3Packages.setuptools pillow term_image python3Packages.urwid];
    propagatedBuildInputs = [term_image python3Packages.requests pillow python3Packages.urwid];

    meta = with lib; {
      description = "TermVisage - a terminal-based visage (visualizer)";
      license = licenses.mit;
      platforms = ["x86_64-linux"];
    };
  }
