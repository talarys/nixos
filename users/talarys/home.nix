{...}: let
  modules = import ../../modules/home;
in {
  imports = [
    modules.browsers
    modules.gaming
    modules.common
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
