{self, ...}: let
  modules = import "${self}/modules/home";
in {
  imports = with modules; [
    shell
    git
    helix
    nushell
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
