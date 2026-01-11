{
  flake.module.nixos.networking =
    { lib, ... }:
    {
      networking = {
        networkmanager.enable = lib.mkDefault true;
        networkmanager.wifi.backend = lib.mkDefault "wpa_supplicant";
        wireless.enable = lib.mkDefault false;
        useDHCP = lib.mkDefault true;
        nameservers = lib.mkDefault [
          "1.1.1.1" # Cloudflare
          "8.8.8.8" # Google
        ];
      };
    };
}
