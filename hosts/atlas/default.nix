{...}: {
  imports = [
    ../common.nix
    ./disko.nix
  ];

  system.roles = [
    "dev"
  ];

  modules = {
    core = {
      networking.enable = false;
    };
  };

  networking.hostName = "atlas";
}
