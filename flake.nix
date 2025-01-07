{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {nixpkgs, nvf, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    configModule = {
      # Add any custom options (and do feel free to upstream them!)
      # options = { ... };

      config.vim = {
        theme.enable = true;
        # and more options as you see fit...
      };
    };

    customNeovim = nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [configModule];
    };
  in {
    # This will make the package available as a flake output under 'packages'
    packages.${system}.my-neovim = customNeovim.neovim;

    # Example nixosConfiguration using the configured Neovim package
    nixosConfigurations = {
      yourHostName = nixpkgs.lib.nixosSystem {
        # ...
        modules = [
          # This will make wrapped neovim available in your system packages
          {environment.systemPackages = [customNeovim.neovim];}
        ];
        # ...
      };
    };
  };
}
