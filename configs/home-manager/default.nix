{
  inputs,
  pkgs,
  catppuccin,
  ...
}: {
  home.username = "enim";
  home.homeDirectory = "/home/enim";

  imports = [
    ./theming.nix
    ./dunst.nix
    ./git.nix
    # ./hyprland.nix
  ];

  home.stateVersion = "24.11";
}
