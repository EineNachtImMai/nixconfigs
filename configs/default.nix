{
  config,
  pkgs,
  inputs,
  host,
  ...
}: {
  imports = [
    ./terminal.nix
    ./packages.nix
    ./users.nix
    ./fonts.nix
    ./pipewire.nix
    ./bluetooth.nix
    inputs.sops-nix.nixosModules.sops
    ./wireless.nix
    inputs.home-manager.nixosModules.home-manager
    ./kanata.nix
    ./bootloader.nix
    ./time-and-locale.nix
    ./networking.nix
    ./services.nix
    ./programs.nix
    ./virtualiztion.nix
  ];
}
