{
  pkgs,
  ...
}:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # lunarvim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
    fastfetch
    vlc
    geeqie
    nwg-look

    ripgrep

    (python3.withPackages (ps: with ps; [numpy matplotlib manim]))
    go
    gcc
    rustc
    cargo
    nodejs

    SDL2
    SDL2.dev
    SDL2_ttf
    # mesa
    glslviewer
    glsl_analyzer
    glslls

    #nix LSP
    nixd

    fzf
    zoxide
    yq

    scribus

    # Manim dependencies
    cairo
    pango
    ffmpeg
    texlive.combined.scheme-small

    alejandra

    # networkmanagerapplet
    dunst
    libnotify
    #  wget
    unzip
    catppuccin-cursors.mochaDark
  ];
}