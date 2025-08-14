{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.core.networking;
in {
  options.modules.core.networking.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable the core networking configuration for NixOS.";
  };

  config = lib.mkIf cfg.enable {
    networking = {
      networkmanager.enable = lib.mkDefault true;
      wireless.enable = lib.mkDefault false;
      nameservers = [
        "1.1.1.1" # Cloudflare
        "8.8.8.8" # Google
      ];
    };
  };
}
