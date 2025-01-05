# https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/neovim/utils.nix#L27
{ pkgs, neovimUtils, wrapNeovimUnstable, ... }:

let
config = pkgs.neovimUtils.makeNeovimConfig {
  extraLuaPackages = p: [ p.magick ];
  extraPackages = p: [ p.imagemagick ];
  # ... other config
};
in {
  nixpkgs.overlays = [
      (_: super: {
      neovim-custom = pkgs.wrapNeovimUnstable
          (super.neovim-unwrapped.overrideAttrs (oldAttrs: {
          buildInputs = oldAttrs.buildInputs ++ [ super.tree-sitter ];
          })) config;
      })
  ];
  environment.systemPackages = with pkgs; [ neovim-custom ];
}
