{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.blackstar = {
    isNormalUser = true;
    description = "EineNachtImMai";
    extraGroups = ["networkmanager" "wheel" "input" "uinput"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
