{...}: {
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks = {
      "La lumière divine".psk = "bobby394";
    };
  };
}
