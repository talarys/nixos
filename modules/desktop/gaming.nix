{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.desktop.gaming;
in
{
  options.modules.desktop.gaming = {
    enable = mkEnableOption "gaming configuration";
  };
  config = mkIf cfg.enable {
    # System packages
    environment.systemPackages = with pkgs; [
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      libva-utils
      glxinfo
      clinfo

      # Game launchers
      steam
      lutris
      heroic
      umu-launcher
      faugus-launcher

      # Compatibility layers
      wine # Windows compatibility layer
      winetricks # Wine helper
      protonup-qt # Manage Proton versions
      protontricks # Proton helper

      # Game utilities
      gamemode # Optimizations for gaming
      mangohud # Performance overlay
      goverlay # GUI for MangoHud and other overlays
      gamescope # SteamOS compositor
      vkBasalt # Vulkan post-processing
      dxvk # Direct3D to Vulkan

      # Hardware monitoring
      nvtopPackages.nvidia # NVIDIA GPU monitoring
    ];

    # Gaming services
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };
      gamemode.enable = true;
    };
  };
}
