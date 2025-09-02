{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.enim = {
    isNormalUser = true;
    description = "EineNachtImMai";
    extraGroups = ["docker" "networkmanager" "wheel" "input" "uinput"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
