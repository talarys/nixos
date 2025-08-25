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
  };

  virtualisation.hypervGuest.enable = true;

  networking.hostName = "atlas";
}
