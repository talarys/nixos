{self, ...}: let
  modules = import "${self}/modules/nixos";
in {
  imports = with modules; [
    system
  ];

  wsl = {
    enable = true;
    defaultUser = "null";
  };

  networking.hostName = "void";

  nix.settings.trusted-users = ["null"];

  system.stateVersion = "24.11";
}
