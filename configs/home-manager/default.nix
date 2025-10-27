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

    ./config-symlinks.nix
  ];

  home.stateVersion = "24.11";
}
