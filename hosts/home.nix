{
  self,
  config,
  ...
}: let
  roleModules = builtins.map (role: "${self}/home/roles/${role}.nix") config.system.roles;
in {
  imports = roleModules;
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
