# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./configs/terminal.nix
    ./configs/packages.nix
    ./configs/users.nix
    ./configs/fonts.nix
    ./configs/pipewire.nix
    inputs.sops-nix.nixosModules.sops
    ./configs/wireless.nix
    ./configs/home.nix
  ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.udisks2.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  # disabled because of the recent privacy poicy changed, finally motivated me to get zen-browser working on nixos

  programs.gnupg.agent.enable = true;

  programs.yazi = {
    flavors = {
      dark = ./yazi/flavors/kanagawa.yazi/flavor.toml;
    };
  };

  # Enable hyprland
  programs.hyprland.enable = true;

  services = {
    xserver = {
      enable = true;
      xkb = {
        variant = "azerty";
        layout = "fr";
      };
    };
    displayManager.sddm = {
      enable = true;
      theme = "sddm-astronaut-theme";
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [sddm-astronaut];
    };
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.1:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.2:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.3:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.4:1.0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps a    s    d    f    g    h    j    k    l    ;    '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rmet rctl
          )
          (defvar
              tap-time 150
              hold-time 200
          )
          (defalias
            cmd-lyr (layer-toggle command-layer)
          )
          (defalias
              caps (tap-hold 150 200 esc @cmd-lyr)
              a (tap-hold $tap-time $hold-time a lsft)
              s (tap-hold $tap-time $hold-time s lctl)
              d (tap-hold $tap-time $hold-time d lmet)
              f (tap-hold $tap-time $hold-time f lalt)

              m (tap-hold $tap-time $hold-time ; lsft)
              l (tap-hold $tap-time $hold-time l lctl)
              k (tap-hold $tap-time $hold-time k lmet)
              j (tap-hold $tap-time $hold-time j lalt)
          )

          (deflayer base
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          @caps @a    @s    @d    @f    _    _    @j    @k    @l    @m    _    _
          _ _    _    _    _    _    _    _    _    _    _    _
          _ _ _           _            _ _ _
          )

          (deflayer empty-layer
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _ _    _    _    _    _    _    _    _    _    _    _    _
          _ _    _    _    _    _    _    _    _    _    _    _
          _ _ _           _            _ _ _
          )

          (deflayer command-layer
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _    ret    _    _    _    _    _    _    _    _    _    _
          @caps _    _    _    _    _    left    down    up    right    _    _    _
          _ _    _    _    _    _    _    _    _    _    _    _
          _ _ _           _            _ _ _
          )
        '';
      };
    };
  };

  # enable auto-update

  system.autoUpgrade = {
    enable = true;
    flake = "./flake.nix";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game localNetworkGameTransfers
  };

  security.polkit.enable = true;

  programs.neovim.defaultEditor = true;

  # Enable thunar as file manager
  programs.thunar.enable = true;

  # programs.kdeconnect.enable = true;

  programs.tmux = {
    enable = true;
  };

  /*
     services.kanata = {
    enable = true;
    keyboards."/dev/input/by-path/platform-i8042-serio-0-event-kbd".configFile = ./configs/kanata.kbd;
  };
  */

  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = ["blackstar"];
        commands = [
          {
            command = "${pkgs.kanata}/bin/kanata";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";

    NIXOS_OZONE_WL = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  /*
     networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
  */

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
