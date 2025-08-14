{...}: {
  imports = [../common.nix];

  system.roles = [
    "desktop"
    "dev"
  ];

  networking.hostName = "argos";
}
