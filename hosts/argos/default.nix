{self, ...}: let
  modules = import "${self}/modules/nixos";
in {
  imports = with modules; [
    ./hardware-configuration.nix
    system
    fonts
    kde
    audio
    hyprland
    nvidia
    gaming
    stylix
    virt
    vpn
  ];

  nix.settings.trusted-users = ["talarys"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "argos";
  networking.networkmanager.enable = true;
}
