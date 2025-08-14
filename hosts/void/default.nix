{...}: {
  imports = [../common.nix];

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
}
