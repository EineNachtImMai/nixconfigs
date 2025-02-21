{
  pkgs,
  ...
}:
{
    networking.wireless = {
        enable = true;
        userControlled.enable = true;
        networks = {
            "Bordeaux-INP" = {
                auth = ''
                    eap=MSCHAPV2
                    identity="tcazaubieil"
                    password="Nomad-inp2023!"
                    '';
            };
            "La lumière divine".psk = "bobby394";
            "Livebox-2282".psk = "6769FC14174EDD5DEE7EDCD2C9";
        };
    };

}
