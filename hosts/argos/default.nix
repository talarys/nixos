{pkgs, ...}: let
  modules = import ../../modules/nixos;
in {
  imports = [
    ./hardware-configuration.nix
    modules.system
    modules.fonts
    modules.kde
    modules.audio
    modules.hyprland
    modules.nvidia
    modules.gaming
    modules.stylix
    modules.virt
    modules.vpn
  ];

  nix.settings.trusted-users = ["talarys"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "argos";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    vscode
    mkpasswd
    firefox

    nil
    alejandra
    deadnix
    statix
  ];
}
