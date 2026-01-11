{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.system.sddm;
in
{
  options.modules.system.sddm = {
    enable = mkEnableOption "Enable SDDM";
  };
  config = mkIf cfg.enable {
    services.displayManager = {
      sddm = {
        package = pkgs.kdePackages.sddm;
        extraPackages = [ pkgs.sddm-astronaut ];
        enable = mkForce true;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";
      };
    };
  };
}
