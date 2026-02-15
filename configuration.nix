{
  inputs,
  ...
}: {
  imports = [
    ./configs
  ];

  programs.mango.enable = true;
  programs.niri.enable = true;

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

  system.stateVersion = "24.05";
}
