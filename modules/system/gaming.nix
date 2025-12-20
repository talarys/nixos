{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.system.gaming;
in
{
  options.modules.system.gaming = {
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

    boot.kernelModules = [
      "uinput"
      "xpad"
    ];
    services.udev.extraRules = ''
      # Xbox One Controller over USB
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="02ea", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="02dd", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b00", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b05", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b12", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b13", MODE="0666", TAG+="uaccess"

      # Xbox Series X|S Controller
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b20", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b21", MODE="0666", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="0b22", MODE="0666", TAG+="uaccess"

      # Xbox 360 Controller
      KERNEL=="hidraw*", ATTRS{idVendor}=="045e", ATTRS{idProduct}=="028e", MODE="0666", TAG+="uaccess"

      # Flydigi Vader 4 Pro Controller (dinput mode)
      KERNEL=="hidraw*", ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="2412", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="input", ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="2412", ENV{ID_INPUT_JOYSTICK}=="1", TAG+="steam-controller"
      SUBSYSTEM=="input", ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="2412", ENV{ID_INPUT_JOYSTICK}=="1", ENV{STEAM_INPUT_ENABLE}="1"
      SUBSYSTEM=="input", ATTRS{idVendor}=="04b4", ATTRS{idProduct}=="2412", ENV{ID_INPUT_JOYSTICK}=="1", RUN+="${pkgs.coreutils}/bin/chmod 666 /dev/input/event%n"
    '';
  };
}
