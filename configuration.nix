# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  host,
  ...
}: let
  ultragrub = pkgs.callPackage ./configs/custom_derivations/ultrakill-grub-theme/ultragrub.nix {};
in {
  imports = [
    # Include the results of the hardware scan.
    ./configs/terminal.nix
    ./configs/packages.nix
    ./configs/users.nix
    ./configs/fonts.nix
    ./configs/pipewire.nix
    ./configs/bluetooth.nix
    # ./configs/dockers.nix
    # ./configs/nvidia.nix
    inputs.sops-nix.nixosModules.sops
    ./configs/wireless.nix
    inputs.home-manager.nixosModules.home-manager
    # ./configs/virtualization.nix
    ./configs/kanata.nix
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

  # Bootloader.
  boot.loader = {
    /*
       efi = {
      # canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    */

    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiInstallAsRemovable = true;
      theme = ultragrub;
      useOSProber = true;
      efiSupport = true;
      devices = ["nodev"];
      extraEntries = ''
        menuentry "Reboot" {
            reboot
        }

        menuentry "Poweroff" {
            halt
        }
      '';
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.nameservers = ["193.110.81.0" "185.253.5.0"];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

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

  programs = {
    gnupg.agent.enable = true;

    yazi = {
      enable = true;
    };

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

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
  };

  security.polkit.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true; # Show battery charge of Bluetooth devices
        };
      };
    };

    graphics = {
      enable = true;
    };
  };

  # enable auto-update
  /*
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
  */

  programs.kdeconnect.enable = true;

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [443];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
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
