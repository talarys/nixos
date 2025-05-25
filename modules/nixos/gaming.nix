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
