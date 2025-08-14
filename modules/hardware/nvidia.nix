{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.hardware.nvidia;
in {
  options.modules.hardware.nvidia = {
    enable = mkEnableOption "NVIDIA hardware support";
  };
  config = mkIf cfg.enable {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware = {
      nvidia = {
        open = true;
        nvidiaSettings = true;
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
      };
    };
  };
}
