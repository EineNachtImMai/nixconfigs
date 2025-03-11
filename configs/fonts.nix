{pkgs, ...}: {
  # Fonts
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
