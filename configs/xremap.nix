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
      A:
        alone: A
        held: leftctrl
        alone_timeout_milis: 150
      S:
        alone: S
        held: fn
        alone_timeout_milis: 150
      F:
        alone: F
        held: leftalt
        alone_timeout_milis: 150
      semicolon:
        alone: semicolon
        held: leftctrl
        alone_timeout_milis: 150
      L:
        alone: L
        held: fn
        alone_timeout_milis: 150
      J:
        alone: J
        held: leftalt
        alone_timeout_milis: 150
    '';
  };
}
