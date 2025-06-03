{pkgs, ...}: let
  modules = import ../../modules/nixos;
  containers = import ../../modules/containers;
in {
  imports = with modules;
  with containers; [
    system
    podman
    audiobookshelf
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
