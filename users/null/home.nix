{
  self,
  config,
  ...
}: let
  roles = config.system.roles;
  roleModules = builtins.map (role: "${self}/home/roles/${role}.nix") roles;
in {
  imports = [] ++ roleModules;
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
