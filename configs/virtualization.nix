{...}: {
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["blackstar"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
