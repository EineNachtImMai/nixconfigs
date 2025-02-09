# TODO: clean things up
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
    # nh

    ripgrep

    (python3.withPackages (ps: with ps; [numpy matplotlib manim]))
    go
    gcc
    rustc
    cargo
    nodejs
    luajit
    luarocks
    imagemagick
    pkg-config
    # luajitPackages.magick
    
    graphviz

    SDL2
    SDL2.dev
    SDL2_ttf
    # mesa
    glslviewer
    glsl_analyzer
    glslls

    # LSPs
    nixd
    lua-language-server
    gopls
    hyprls
    marksman
    yaml-language-server
    typescript-language-server
    haskell-language-server
    bash-language-server
    arduino-language-server


    fzf
    zoxide
    yq

    kanata-with-cmd
    # gtypist
    klavaro

    scribus

    # Manim dependencies
    cairo
    pango
    ffmpeg
    texlive.combined.scheme-small

    alejandra
    stylua
    rustfmt
    isort
    black
    gotools


    spotify
    itch
    ryujinx

    # networkmanagerapplet
    dunst
    libnotify
    #  wget
    unzip
    catppuccin-cursors.mochaDark

    gparted



    # plasma5Packages.kdeconnect-kde
    gimp

    pokemmo-installer

    sddm-astronaut

    kando

    lazygit

    yazi


    obsidian
  ];
}
