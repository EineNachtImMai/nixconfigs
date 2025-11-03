{
  config,
  pkgs,
  inputs,
  host,
  ...
}: {
  imports = [
    ./configs
    # inputs.hyprland.nixosModules.default
  ];

  catppuccin = {
    tty.enable = true;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      enim = import ./configs/home.nix;
    };
    backupFileExtension = "bak";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  security.polkit.enable = true;

  hardware = {
    graphics = {
      enable = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
