{
  config,
  pkgs,
  ...
}: {
  # Hardware configuration
  hardware = {
    # CPU Microcode
    cpu.amd.updateMicrocode = true;
  };

  # Kernel configuration
  boot = {
    kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
    kernelParams = [
      "nvidia_drm.modeset=1"
      "amd_iommu=on"
    ];
    extraModulePackages = [config.boot.kernelPackages.nvidia_x11];
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    libva-utils
    glxinfo
    clinfo
  ];

  # Gaming services
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

  # Performance optimizations
  powerManagement.cpuFreqGovernor = "performance";
  services.thermald.enable = true;
}
