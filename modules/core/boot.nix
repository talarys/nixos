{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.core.boot;
in {
  options.modules.core.boot.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable the core boot configuration for NixOS.";
  };

  config = mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot = {
          enable = lib.mkDefault true;
          configurationLimit = 10;
          editor = false;
        };
        efi.canTouchEfiVariables = lib.mkDefault true;
        timeout = lib.mkDefault 3;
      };

      plymouth.enable = lib.mkDefault false;
    };
  };
}
