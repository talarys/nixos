{self, ...}: {
  imports = [
    "${self}/home/roles/dev.nix"
    "${self}/home/roles/desktop.nix"
  ];

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "talarys";
    homeDirectory = "/home/talarys";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
