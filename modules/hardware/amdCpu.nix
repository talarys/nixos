{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.hardware.amdCpu;
in
with lib;
{
  options.modules.hardware.amdCpu = {
    enable = mkEnableOption "AMD CPU microcode updates";
  };
  config = mkIf cfg.enable {
    hardware = {
      cpu.amd.updateMicrocode = true;
    };
  };
}
