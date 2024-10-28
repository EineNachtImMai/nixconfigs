{
  /* config,
  pkgs, */
  inputs,
  ...
}:
{
  imports = [
        inputs.xremap-flake.nixosModules.default
  ];
  services.xremap = {
    withWlroots = true;
    userName = "blackstar";
    yamlConfig = ''
modmap:
  - name: main remaps
    remap:
      CapsLock:
        held: leftctrl
        alone: esc
        alone_timeout_milis: 150
    '';
  };
}
