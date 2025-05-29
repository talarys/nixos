{...}: let
  modules = import ../../modules/home;
in {
  imports = [
    modules.shell
    modules.fish
    modules.git
    modules.helix
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
