{self, ...}: {
  imports = [
    "${self}/home/roles/dev.nix"
  ];
  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "null";
    homeDirectory = "/home/null";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
