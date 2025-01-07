{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {self, nixpkgs, nvf, ... }: {
    /* packages."x86_64-linux".default = 
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./nvf-configuration.nix ];
       }).neovim; */
    # ↓ this is your host output in the flake schema
    nixosConfigurations.blackstar = nixpkgs.lib.nixosSystem {
      modules = [
        nvf.nixosModules.default # <- this imports the NixOS module that provides the options
        ./configuration.nix # <- your host entrypoint, `programs.nvf.*` may be defined here
      ];
    };
  };
}
