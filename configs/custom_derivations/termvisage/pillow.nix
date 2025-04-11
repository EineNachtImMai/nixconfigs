{
  lib,
  fetchPypi,
  python3Packages,
  pkgs,
  ...
}:
python3Packages.buildPythonPackage rec {
  pname = "pillow";
  version = "10.4.0"; # You can specify the version or use "latest"
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Fmwc1NJDCbMNYfefSpEUt7IxPXRQkSJ3hV/139fNSgY="; # You can get this hash by running `nix-prefetch-url <url>`
  };
  nativeBuildInputs = with pkgs; [pkg-config];

  buildInputs = with pkgs; [zlib lcms2 libjpeg libtiff libwebp openjpeg libimagequant libraqm libavif python3Packages.setuptools];
  propagatedBuildInputs = with pkgs; [zlib lcms2 libjpeg libtiff libwebp openjpeg libimagequant libraqm libavif python3Packages.setuptools];

  meta = with lib; {
    description = "TermImage - a library for visualizing images in the terminal";
    license = licenses.mit;
  };
}
