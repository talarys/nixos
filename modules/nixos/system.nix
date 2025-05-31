{...}: {
  nixpkgs = {
    overlays = import ../../pkgs {};
    config.allowUnfree = true;
  };

  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.nix-ld.enable = true;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      download-buffer-size = "30G";
      accept-flake-config = true;
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "24.11";
}
