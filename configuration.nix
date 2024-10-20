# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # nix.settings.experimental-features = ["nix-command" "flakes"];

  # boot.loader = {
  #   grub = {
  #     device = "nodev";
  #     enable = true;
  #     useOSProber = true;
  #     efiSupport = true;
  #   };
  #   efi.canTouchEfiVariables = true;
  # };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.udisks2.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.blackstar = {
    isNormalUser = true;
    description = "EineNachtImMai";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # services.greetd = {
  #   enable = true;
  #   settings = rec {
  #     initial_session = {
  #       command = "${pkgs.hyprland}/bin/Hyprland";
  #       user = "blackstar";
  #     };
  #     default_session = initial_session;
  #   };
  # };

  # Install firefox.
  programs.firefox.enable = true;

  # Enable hyprland
  programs.hyprland.enable = true;

  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game localNetworkGameTransfers
  };


  # make zsh default
  programs.zsh.enable = true;                                                                                                    
  users.defaultUserShell = pkgs.zsh;

  # # Enable Oh-my-zsh
  programs.zsh.ohMyZsh = {
    enable = true;
     plugins = [ "git"];
  };
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # programs.neovim = {
  # enable = true;
  # configure = {
  #   customRC = ''
  #     set rnu
  #     set cc=80
  #     set list
  #     set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
  #     if &diff
  #       colorscheme blue
  #     endif
  #   '';
  #   packages.myVimPackage = with pkgs.vimPlugins; {
  #     start = [ ctrlp ];
  #     };
  #   };
  # };

  programs.neovim.defaultEditor = true;


  # Enable thunar as file manager
  programs.thunar.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   lunarvim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   kitty
   wofi
   zsh
   git
   waybar
   brightnessctl
   pamixer
   hyprpaper
   hyprlock
   hyprcursor
   wlogout
   neovim
   slurp
   grim
   wl-clipboard
   nerdfetch
   vlc
   geeqie
   nwg-look

   ripgrep

   (python3.withPackages (ps: with ps; [ numpy matplotlib manim ]))
   go
   gcc
   rustc
   cargo
   nodejs

   scribus

  # Manim dependencies
  cairo
  pango
  ffmpeg
  texlive.combined.scheme-small
  # tex

  # steam

   # networkmanagerapplet
   dunst
   libnotify
  #  wget
  unzip
  ];

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
