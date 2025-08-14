{self, ...}: {
  imports = ["${self}/modules"];

  system.roles = [
    "desktop"
    "dev"
  ];

  nix.settings.trusted-users = ["talarys"];

  networking.hostName = "argos";
  networking.networkmanager.enable = true;
}
