# lightly adapted from https://blog.daniel-beskin.com/2025-10-18-symlinking-home-manager
{
  config,
  lib,
  ...
}: let
  symlinkRoot = /home/enim/dev/nix/dotfiles/;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (lib) flatten flip map mergeAttrsList;

  pipe = flip lib.pipe;
  flatMerge = pipe [flatten mergeAttrsList];

  toSrcFile = name: "${symlinkRoot}/${name}";
  link = pipe [toSrcFile mkOutOfStoreSymlink];

  linkFile = name: {${name}.source = link name;};
  linkDir = name: {
    ${name} = {
      source = link name;
      recursive = true;
    };
  };

  linkConfFiles = map linkFile;
  linkConfDirs = map linkDir;

  confFiles = linkConfFiles [
    "starship.toml"
  ];

  confDirs = linkConfDirs [
    "nvim"
    "eza"
    "hypr"
    "nixpkgs"
    "wlogout"
    "zsh"
    "fastfetch"
    "kitty"
    "nushell"
    "waybar"
    "wofi"
    "zsh-abbr"
  ];

  links = flatMerge [confFiles confDirs];
in {
  xdg.configFile = links;
}
