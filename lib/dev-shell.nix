{
  inputs,
  system ? "x86_64-linux",
}: let
  # Instantiate nixpkgs with the given system and allow unfree packages
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      # Add overlays if needed, e.g., inputs.neovim-nightly-overlay.overlays.default
    ];
  };
in
  pkgs.mkShell {
    name = "nixos-dev";
    NIX_CONFIG = "experimental-features = nix-command flakes";
    packages = with pkgs; [
      # Nix tools
      alejandra # Nix code formatter
      deadnix # Dead code detection
      statix # Nix static analysis
      nixd # Nix language server
      nh # Nix helper
      disko # Disk partitioning tool

      # Code editing
      helix
      neovim

      # General utilities
      git
    ];

    shellHook = ''
      echo "Welcome to the NixOS development shell!"
      echo "System: ${system}"
    '';
  }
