{pkgs, ...}: let
  hyprtasking = pkgs.fetchFromGitHub {
    owner = "hyprwm";
    repo = "HyprTasking";
    rev = "main"; # Adjust this to the correct branch or commit
    sha256 = "..."; # You need to compute the sha256 for the fetch
  };
in {
  environment.systemPackages = [
    hyprtasking
  ];

  # Update the configuration if necessary, e.g., for running the tool with Hyprland
}
