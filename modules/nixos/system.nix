{inputs, ...}: let
  overlays = import ../../overlays {inherit inputs;};
in {
  nixpkgs = {
    inherit overlays;
    config.allowUnfree = true;
  };

  time.timeZone = "Europe/Madrid";

  i18n.defaultLocale = "en_US.UTF-8";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      download-buffer-size = "30G";
      trusted-users = ["talarys"];
      accept-flake-config = true;
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "24.11";
}
