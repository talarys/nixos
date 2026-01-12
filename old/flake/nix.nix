{
  flake.modules.nixos.nix = {
    enable = true;
    optimise.automatic = true;

    nixpkgs.config.allowUnfree = true;
    programs.nix-index-database.comma.enable = true;
    programs.nix-ld.enable = true;

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    settings = {
      http-connections = 50;
      log-lines = 50;
      warn-dirty = false;
      extra-system-features = [ "recursive-nix" ];
      accept-flake-config = true;
      auto-optimise-store = true;

      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
        "recursive-nix"
      ];

      trusted-users = [
        "root"
        "@wheel"
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://cache.flox.dev"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
      ];
    };
  };
}
