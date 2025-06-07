{pkgs, ...}: let
  modules = import ../../modules/nixos;
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
  environment.systemPackages = with pkgs; [
    git
    wget
    alejandra
    deadnix
    statix
    nil
    neovim
  ];

  system.stateVersion = "24.11";
}
