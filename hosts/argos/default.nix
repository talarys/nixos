{
  outputs,
  pkgs,
  ...
}: let
  modules = import ../../modules/nixos;
in {
  imports = [
    ./hardware-configuration.nix
    modules.system
    modules.fonts
    modules.kde
    modules.hyprland
    modules.nvidia
    modules.gaming
    modules.stylix
    modules.virt
    modules.vpn
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = outputs.hostname;
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
