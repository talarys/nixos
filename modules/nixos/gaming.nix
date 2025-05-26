{pkgs, ...}: {
  # Hardware configuration
  hardware = {
    cpu.amd.updateMicrocode = true;
  };

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
}
