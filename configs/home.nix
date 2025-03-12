{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  home.username = "blackstar";
  home.homeDirectory = "/home/blackstar";
  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";

  home.packages = [
    pkgs.hyprland
  ];

  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprtasking.packages.${outputs.system}.hyprtasking
    ];
  };
}
