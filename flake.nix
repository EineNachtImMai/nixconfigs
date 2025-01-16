{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ... }: {
    # ↓ this is your host output in the flake schema
    nixosConfigurations.blackstar = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix # <- your host entrypoint, `programs.nvf.*` may be defined here
      ];
    };
  };
}
