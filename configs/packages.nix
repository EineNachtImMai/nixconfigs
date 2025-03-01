# TODO: clean things up
{
  pkgs,
  inputs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # lunarvim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    # terminal
    kitty

    # inputs.zen-browser.packages."${system}".generic
    (callPackage ./zen.nix {})

    # terminal multiplexer
    zellij

    # app launchers
    wofi
    kando

    # shell
    zsh

    wpa_supplicant_gui

    spotify-player
    spicetify-cli

    pipewire
    wireplumber
    xdg-desktop-portal-hyprland

    discord

    # secrets manager
    sops

    # self-explanatory
    git

    # random hyprland/wayland config/ricing stuff
    waybar
    brightnessctl
    pamixer
    hyprpaper
    hyprlock
    hyprcursor
    wlogout
    dunst
    libnotify
    sddm-astronaut

    # Text editor
    neovim
    markdown-oxide

    # screenshot utilities
    slurp
    grim
    wl-clipboard

    # neofetch replacement
    fastfetch

    # video player
    vlc

    zoom-us

    # lightweight image viewer
    geeqie

    # GTK settings editor, because i struggled with my corsor for a while
    nwg-look

    # recursively search a dir for some text (really a regex but shhhhhhhh)
    ripgrep

    # programming languages
    (python3.withPackages (ps: with ps; [numpy matplotlib manim opencv4]))
    go
    gcc
    rustc
    cargo
    nodejs
    # luajit
    # luarocks
    # imagemagick
    # pkg-config
    # luajitPackages.magick
    sqlite

    jq
    pandoc

    vipsdisp

    mdbook

    # necessary for tauri development
    pkg-config
    gobject-introspection
    cargo-tauri
    at-spi2-atk
    atkmm
    cairo
    gdk-pixbuf
    glib
    gtk3
    harfbuzz
    librsvg
    libsoup_2_4
    libsoup_3
    pango
    webkitgtk_4_1
    openssl

    # Manim dependencies
    cairo
    pango
    ffmpeg
    texlive.combined.scheme-small

    # graph to image converter, needed it for a python project
    # graphviz

    # the absolute nightmare that is trying to develop GLSL
    SDL2
    SDL2.dev
    SDL2_ttf
    # mesa
    glslviewer

    # LSPs
    nixd
    lua-language-server
    gopls
    yaml-language-server
    pyright
    # rust-analyzer
    # TODO: make all the following work with neovim, currently only the previous ones are working.
    typescript-language-server
    haskell-language-server
    bash-language-server
    arduino-language-server
    glsl_analyzer
    glslls
    hyprls
    marksman

    # fuzzy finder for the CLI
    fzf

    # Basically just bette cd
    zoxide

    # YAML, JSON and XML processor
    # yq

    # keyboard remapper
    kanata-with-cmd

    # learn typing
    klavaro

    # PDF editor and annotator
    scribus

    # Code formatters
    alejandra
    stylua
    rustfmt
    isort
    black
    gotools

    # because music is cool
    spotify

    # Games stuff
    itch
    ryujinx
    pokemmo-installer

    # useful for decompressing archives
    unzip

    # corsor theme
    catppuccin-cursors.mochaDark

    # image editor that's like photoshop except very open and with slightly worse UI. Also it's free.
    # gimp

    # great git TUI because I DON'T KNOW how to use git other than clone pull push add commit, I swear I'll get to learning it eventually.
    lazygit

    # Great terminal file browser with even image previews using the kitty protocol
    yazi

    # good directory listing for visualization
    tree

    # GREAT markdown editor / note-taking app. Free for personal use which is awesome. My current workflow is to write the notes in neovim
    # and read them in obsidian, because as much as i love my config and think it looks great, I can't for the life of me make 3rd/image.nvim work.
    # I'll figure it out eventually but it just interacts really bad with NixOS as far as I can tell. Also ovsidian looks way better anyway.
    obsidian
  ];
}
