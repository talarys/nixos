{ lib, config, ... }:

let
  cfg = config.modules.system.bluetooth;
in
{
  options.modules.system.bluetooth = {
    enable = lib.mkEnableOption "Enable bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
    };
    services.blueman.enable = true;
  };
}
