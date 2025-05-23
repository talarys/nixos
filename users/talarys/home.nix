{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "talarys";
    homeDirectory = "/home/talarys";
  };

  programs.git = {
    userName = "talarys";
    userEmail = "d.simon.ssx0@gmail.com";
  };

  home.packages = with pkgs; [steam];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
