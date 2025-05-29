{pkgs, ...}: {
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  programs.nix-ld.enable = true;

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

  system.stateVersion = "24.11"; # Did you read the comment?
}
