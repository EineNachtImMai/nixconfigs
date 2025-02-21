{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self,
    nixpkgs,
    sops-nix,
    ...
  }@inputs: {
    # ↓ this is your host output in the flake schema
    nixosConfigurations.blackstar = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix # <- your host entrypoint, `programs.nvf.*` may be defined here
        sops-nix.nixosModules.sops
      ];
    };
  };
}
