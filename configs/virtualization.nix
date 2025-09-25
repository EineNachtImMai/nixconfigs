{...}: {
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["enim"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.docker.enable = true;
}
