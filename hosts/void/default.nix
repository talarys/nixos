{pkgs, ...}: let
  modules = import ../../modules/nixos;
in {
  imports = [
    modules.system
  ];

  wsl = {
    enable = true;
    defaultUser = "nixos";
    docker-desktop.enable = true;
  };

  networking.hostName = "void";
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    alejandra
    deadnix
    statix
    nil
    neovim
  ];
}
