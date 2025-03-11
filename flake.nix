{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    zen-browser.url = "github:MarceColl/zen-browser-flake";

    hyprland.url = "github:hyprwm/Hyprland/v0.46.2";

    hyprtasking = {
      url = "github:raybbian/hyprtasking";
      # inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    sops-nix,
    ...
  } @ inputs: {
    # ↓ this is your host output in the flake schema
    nixosConfigurations.blackstar = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix # <- your host entrypoint, `programs.nvf.*` may be defined here
        sops-nix.nixosModules.sops
      ];
    };
  };
}
