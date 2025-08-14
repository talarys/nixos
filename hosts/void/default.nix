{self, ...}: {
  imports = [
    ../common.nix
    "${self}/modules"
  ];

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
    defaultUser = "talarys";
  };

  networking.hostName = "void";

  nix.settings.trusted-users = ["talarys"];

  system.stateVersion = "24.11";
}
