{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";

    catppuccin.url = "github:catppuccin/nix";

    hyprland.url = "github:hyprwm/Hyprland";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    sops-nix,
    catppuccin,
    zen-browser,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    mkHostConfig = host:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./configuration.nix
          ./hostconfig/${host}-hardware-configuration.nix
          ./hostconfig/${host}-configuration.nix
          sops-nix.nixosModules.sops
          catppuccin.nixosModules.catppuccin
        ];
      };
  in {
    # ↓ this is your host output in the flake schema
    nixosConfigurations.homelap = mkHostConfig "homelap";

    nixosConfigurations.worklap = mkHostConfig "worklap";
  };
}
