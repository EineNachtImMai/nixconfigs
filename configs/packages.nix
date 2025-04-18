# TODO: clean things up
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    htop

    transmission_4-gtk

    # terminal
    kitty

    # nicer cat
    bat

    # proxy
    proxychains

    # tor
    tor-browser

    # vim inspired browser i wanna try out
    vieb

    # sddm theme
    catppuccin-sddm

    # self-explanatory
    home-manager

    # firefox fork that, afaik, doesn't have all the privacy bullshit
    (callPackage ./custom_derivations/zen/zen.nix {})

    # my first actual derivation, a python TUI image visualiser
    (callPackage ./custom_derivations/termvisage/termvisage.nix {})

    # cheatsheet engine for the terminal
    # (callPackage ./custom_derivations/crib/crib.nix {})

    # terminal multiplexer
    zellij

    # task manager
    todoist-electron

    # manual pages
    tealdeer
    # wikiman

    # email client
    notmuch

    # app launchers
    wofi
    # kando

    # shell
    zsh
    nushell
    # carapace
    starship

    # network manager
    wpa_supplicant_gui

    pipewire
    wireplumber
    xdg-desktop-portal-hyprland

    # chat app
    discord

    # NOTE: script for rebuilding my config without having to run multiple commands and deal with the outputs
    (
      writeShellApplication {
        name = "rebuild";
        runtimeInputs = [];
        text = ''
          #!/usr/bin/env bash

          echo "Formatting dotfiles..."
          alejandra /etc/nixos &>/dev/null || ( alejandra . ; echo "formatting failed!" && exit 1)
          echo "rebuilding NixOS..."
          log_path="/home/blackstar/.nix-log/$(date -d today +%F--%T).log"
          nixos-rebuild switch --flake /etc/nixos#blackstar --upgrade --show-trace 2>> "$log_path" || (grep -f "$log_path" --color error && exit 1)
          echo "collecting garbage..."
          nix-collect-garbage -d --delete-older-than 10d 2>> "$log_path" || (grep -f "$log_path" --color error && exit 1)
          echo "Done!"
        '';
      }
    )

    # video, audio, ... VLC is the greatest
    vlc

    # secrets manager
    sops

    # self-explanatory
    git

    # random hyprland/wayland config/ricing stuff
    waybar
    brightnessctl
    playerctl
    pamixer
    hyprpaper
    hyprlock
    hyprcursor
    wlogout
    dunst
    libnotify

    # Text editor
    neovim
    # markdown-oxide

    # TODO: uninstall instantly after the statistics test
    rstudio

    # screenshot utilities
    slurp
    grim
    wl-clipboard

    # neofetch replacement
    fastfetch

    # lightweight image viewer
    geeqie

    # recursively search a dir for some text (really a regex but shhhhhhhh)
    ripgrep

    # programming languages
    (python3.withPackages (
      ps:
        with ps; [
          numpy
          matplotlib
          manim
          opencv4
          scikit-learn
          astropy
          beautifulsoup4
          pandas
          lxml
        ]
    ))
    go
    gcc
    rustc
    cargo
    rustlings
    nodejs
    sqlite

    # haskell
    ghc
    cabal-install
    stack

    # requirements for nvim plugins
    imagemagick
    mermaid-cli
    ghostscript
    tree-sitter
    (
      texlive.combine {inherit (pkgs.texlive) scheme-medium standalone varwidth preview;}
    )

    jq
    pandoc
    silicon

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
    rust-analyzer
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
    gimp

    # vector image editor
    inkscape

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
