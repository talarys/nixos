{...}: {
  imports = [
    ../common.nix
    ./disko.nix
    ./hardware-configuration.nix
  ];

  system.roles = [
    "dev"
  ];

  modules = {
    core = {
      networking.enable = false;
      hardened.enable = false;
    };
    containers = {
      audiobookshelf.enable = true;
    };
  };

  virtualisation.hypervGuest.enable = true;

  networking.hostName = "atlas";
}
