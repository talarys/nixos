{self, ...}: let
  modules = import "${self}/modules/nixos";
in {
  imports = with modules; [
    ./hardware-configuration.nix
    roles
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

  system.roles = [
    "desktop"
    "dev"
  ];

  nix.settings.trusted-users = ["talarys"];

  networking.hostName = "argos";
  networking.networkmanager.enable = true;
}
