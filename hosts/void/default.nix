{pkgs, ...}: let
  modules = import ../../modules/nixos;
in {
  imports = [
    modules.system
  ];

  wsl = {
    enable = true;
    defaultUser = "null";
    docker-desktop.enable = true;
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
