{...}: let
  modules = import ../../modules/home;
in {
  imports = [
    modules.browsers
    modules.shell
    modules.fish
    modules.git
    modules.programs
    modules.mpv
    modules.helix
    modules.terminals
    modules.stylix
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
