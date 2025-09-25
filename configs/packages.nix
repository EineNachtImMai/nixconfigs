# TODO: clean things up
{
  inputs,
  system,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # firefox fork that, afaik, doesn't have all the privacy bullshit
    inputs.zen-browser.packages."${system}".default

    yt-dlp
    vdhcoapp

    cloudflared

    signal-desktop

    losslesscut-bin

    wineWowPackages.stable
    wineWayland
    winetricks
    (bottles.override {removeWarningPopup = true;})
    protontricks

    # libreoffice

    htop

    man-pages

    # transmission_4-gtk

    # terminal
    kitty

    # nicer cat
    bat

    # proxy
    # proxychains

    cudatoolkit

    cudatoolkit

    # tor
    # tor-browser

    # sddm theme
    catppuccin-sddm

    # self-explanatory
    home-manager

    # my first actual derivation, a python TUI image visualiser
    # (callPackage ./custom_derivations/termvisage/termvisage.nix {})

    # deezer package (unofficial)
    deezer-enhanced

    # cheatsheet engine for the terminal
    # (callPackage ./custom_derivations/crib/crib.nix {})

    # terminal multiplexer
    # zellij

    # task manager
    # todoist-electron

    # manual pages
    tealdeer
    # wikiman

    # email client
    # notmuch

    # app launchers
    wofi

    # shell
    zsh
    zsh-abbr
    zinit
    nushell
    eza
    starship

    # network manager
    # wpa_supplicant_gui

    # pipewire
    # wireplumber

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
          alejandra /etc/nixos
          echo "rebuilding NixOS..."
          nh os switch /etc/nixos -H enim
          echo "collecting garbage..."
          nh clean all --keep 5
          echo "Done!"
        '';
      }
    )

    (writeShellApplication {
      name = "update";
      runtimeInputs = [];
      text = ''
        #!/usr/bin/env bash

        echo "Formatting dotfiles..."
        alejandra /etc/nixos
        echo "updating flake..."
        nix flake update --flake /etc/nixos
        echo "rebuilding NixOS..."
        nh os switch /etc/nixos -H enim
        echo "collecting garbage..."
        nh clean all --keep 5
        echo "Done!"
      '';
    })

    jekyll

    # video, audio, ... If there's a media format out there, it can open it
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
    freetube
    hyprcursor
    wlogout
    dunst
    libnotify

    # Text editor
    neovim

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
          # manim
          # opencv4
          # scikit-learn
          # astropy
          # beautifulsoup4
          # pandas
          # lxml
        ]
    ))
    go
    gcc
    rustc
    cargo
    rustlings
    sqlite
    nodejs
    typst

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

    # for when geequie doesn't cut it
    vipsdisp

    # LSPs
    nixd #nix
    lua-language-server #lua
    gopls # go
    # yaml-language-server # yaml
    pyright # python
    rust-analyzer # rust
    markdown-oxide # markdown
    tinymist # typst
    clang-tools # C
    # bash-language-server # bash
    # haskell-language-server

    # fuzzy finder for the CLI
    fzf

    # Basically just better cd
    zoxide

    # lightweight pdf reader
    (pkgs.zathura.override {
      plugins = with pkgs.zathuraPkgs; [
        zathura_pdf_mupdf
      ];
    })

    # Code formatters
    alejandra
    stylua
    rustfmt
    isort
    black
    gotools
    typstyle

    # Games stuff
    itch
    ryubing
    # pokemmo-installer
    prismlauncher
    beyond-all-reason

    # corsor theme
    catppuccin-cursors.mochaDark

    # image editor that's like photoshop except very open and with "slightly" worse UI. Also it's free.
    # gimp

    # vector image editor
    # inkscape

    # great git TUI because I DON'T KNOW how to use git other than clone pull push add commit, I swear I'll get to learning it eventually.
    lazygit

    # good directory listing for visualization
    # tree

    # GREAT markdown editor / note-taking app. Free for personal use which is awesome. My current workflow is to write the notes in neovim
    # and read them in obsidian, because as much as i love my config and think it looks great, I can't for the life of me make 3rd/image.nvim work.
    # I'll figure it out eventually but it just interacts really bad with NixOS as far as I can tell. Also obsidian looks way better anyway.
    obsidian
  ];
}
