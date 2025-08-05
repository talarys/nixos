{self, ...}: let
  modules = import "${self}/modules/home";
in {
  imports = with modules; [
    browsers
    shell
    fish
    git
    programs
    mpv
    helix
    terminals
    stylix
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
