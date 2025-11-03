{pkgs, ...}: let
  ultragrub = pkgs.callPackage ./custom_derivations/ultrakill-grub-theme/ultragrub.nix {};
in {
  boot.loader = {
    /*
       efi = {
      # canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    */

    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiInstallAsRemovable = true;
      theme = ultragrub;
      useOSProber = true;
      efiSupport = true;
      devices = ["nodev"];
      extraEntries = ''
        menuentry "Reboot" {
            reboot
        }

        menuentry "Poweroff" {
            halt
        }
      '';
    };
  };
}
