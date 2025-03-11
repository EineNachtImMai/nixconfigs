{pkgs, ...}: {
  imports = [<home-manager/nixos>];

  users.users.blackstar.isNormalUser = true;
  home-manager.users.blackstar = {pkgs, ...}: {
    home.packages = [pkgs.atool pkgs.httpie];
    programs.bash.enable = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";
  };
}
