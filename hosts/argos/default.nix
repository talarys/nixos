{...}: {
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  system.roles = [
    "desktop"
    "dev"
  ];

  networking.hostName = "argos";
}
