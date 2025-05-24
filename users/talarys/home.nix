{...}: let
  modules = import ../../modules/home;
in {
  imports = [
    modules.browsers
    modules.gaming
    modules.shell
    modules.fish
    modules.git
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
