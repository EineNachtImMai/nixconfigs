{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "crib";
  version = "0526217";

  src = fetchFromGitHub {
    owner = "noelzubin";
    repo = pname;
    rev = version;
    hash = "sha256-gyWnahj1A+iXUQlQ1O1H1u7K5euYQOld9qWm99Vjaeg=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-9atn5qyBDy4P6iUoHFhg+TV6Ur71fiah4oTJbBMeEy4=";

  meta = {
    description = "Cheatsheet maker for the terminal";
    homepage = "https://github.com/noelzubin/crib";
    license = lib.licenses.mit;
  };
}
