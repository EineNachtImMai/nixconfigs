{pkgs, ...}: {
  services = {
    openssh.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    ratbagd.enable = true;

    udisks2.enable = true;

    cloudflared.enable = true;

    xserver = {
      enable = true;
      xkb = {
        variant = "azerty";
        layout = "fr";
      };
    };

    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha-mauve";
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
    };
  };
}
