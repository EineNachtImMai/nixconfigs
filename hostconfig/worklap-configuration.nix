{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.xserver.videoDrivers = ["amdgpu"];
}
