{lib, ...}: {
  imports = [../../modules];

  system.roles = [
    "dev"
  ];

  modules = {
    core = {
      boot.enable = false;
      hardened.enable = false;
      networking.enable = false;
    };
  };

  wsl = {
    enable = true;
    defaultUser = "null";
  };

  networking.hostName = "void";

  nix.settings.trusted-users = ["null"];

  system.stateVersion = "24.11";
}
