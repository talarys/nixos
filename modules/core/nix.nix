{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes" "pipe-operators"];
      download-buffer-size = "30G";
      accept-flake-config = true;
      auto-optimise-store = true;
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.c.achix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  programs.nix-ld.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    alejandra
    deadnix
    statix
    nil
    neovim
    mkpasswd
    nix-output-monitor
  ];

  system.stateVersion = "24.11";
}
