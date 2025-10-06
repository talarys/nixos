{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.desktop.kde;
in
{
  options.modules.desktop.kde = {
    enable = mkEnableOption "KDE Plasma configuration";
  };
  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.xserver.xkb.layout = "us";
    programs.kdeconnect.enable = true;
  };
}
