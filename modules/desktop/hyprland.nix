{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.desktop.hyprland;
in
{
  options.modules.desktop.hyprland = {
    enable = mkEnableOption "Hyprland configuration";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hyprland
      hyprlock
      hypridle
      hyprpaper
      hyprpicker
      rofi-wayland
      waybar
    ];
    services = {
      displayManager.sddm.enable = true;
      hypridle.enable = true;
    };
    programs = {
      hyprlock.enable = true;
      hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
      };
    };
  };
}
