{pkgs, ...}: {
  home.packages = with pkgs; [
    # Game launchers
    steam
    lutris
    steamtinkerlaunch
    heroic
    bottles

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
    corectrl # GPU control
    nvtopPackages.nvidia # NVIDIA GPU monitoring
  ];
}
