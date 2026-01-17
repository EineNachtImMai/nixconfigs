{...}: {
  programs = {
    gnupg.agent.enable = true;

    yazi = {
      enable = true;
    };

    /*
       hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
      # plugins = with pkgs.hyprlandPlugins; [hyprexpo];
    };
    */

    nix-ld.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game localNetworkGameTransfers
    };

    neovim.defaultEditor = true;

    # Enable thunar as file manager
    thunar.enable = true;

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 5 --keep-since 3d";
      flake = "/etc/nixos";
    };

    kdeconnect.enable = true;
  };
}
