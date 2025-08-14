{...}: {
  imports = [
    ../modules/containers/audiobookshelf.nix
    ../modules/core/boot.nix
    ../modules/core/hardened.nix
    ../modules/core/locale.nix
    ../modules/core/networking.nix
    ../modules/core/nix.nix
    ../modules/core/roles.nix
    ../modules/desktop/audio.nix
    ../modules/desktop/fonts.nix
    ../modules/desktop/gaming.nix
    ../modules/desktop/hyprland.nix
    ../modules/desktop/kde.nix
    ../modules/desktop/stylix.nix
    ../modules/hardware/amdCpu.nix
    ../modules/hardware/nvidia.nix
    ../modules/network/vpn.nix
    ../modules/virtualization/podman.nix
    ../modules/virtualization/virt.nix
  ];
}
