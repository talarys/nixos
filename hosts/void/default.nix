{pkgs, ...}: let
  modules = import ../../modules/nixos;
  containers = import ../../modules/containers;
in {
  imports = with modules; [
    system
    podman
  ];

  virtualisation.oci-containers.containers = with containers; {
    inherit lazylibrarian;
  };

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
