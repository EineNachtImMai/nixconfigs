{
  config,
  pkgs,
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
    config = {
      keymap = [
        {
          name = "main remaps";
          remap = {
            CapsLock = {
              held = "lctrl";
              alone = "esc";
              alone_timeout_milis = 150;
            };
          };
        }
      ];
    };
  };
}
