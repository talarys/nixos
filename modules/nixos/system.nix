{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs = {
    overlays = import ../../pkgs {inherit inputs;};
    config.allowUnfree = true;
  };

  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.nix-ld.enable = true;

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
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      download-buffer-size = "30G";
      accept-flake-config = true;
      auto-optimise-store = true;
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "24.11";
}
