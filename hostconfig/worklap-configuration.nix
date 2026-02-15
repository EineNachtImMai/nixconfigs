{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.xserver.videoDrivers = ["amdgpu"];

  environment.systemPackages = with pkgs; [
    texliveFull
  ];
}
