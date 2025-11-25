{
  config,
  pkgs,
  inputs,
  host,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = false;
    # nvidiaSettings = true;
    # dynamicBoost.enable = true;
    powerManagement.enable = false;
    # powerManagement.finegrained = true;
    #nvidiaPersistenced = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:1:0:0";
      nvidiaBusId = "PCI:0:2:0";
    };
  };

  environment.systemPackages = with pkgs; [
    beyond-all-reason

    cudatoolkit
  ];
}
