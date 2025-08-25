{
  self,
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    "${self}/modules"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.talarys = import ./home.nix {inherit config self;};
    extraSpecialArgs = {inherit inputs self;};
  };

  nixpkgs.config.allowUnfree = true;

  environment.shells = with pkgs; [bash nushell];

  programs.nix-index-database.comma.enable = true;

  programs.nix-ld.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/home/talarys/nixos";
  };

  nix = {
    settings = {
      trusted-users = ["talarys"];
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
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAUAzIuK7sfr9TTOyOmWM3nm7kWZLJt0H08VLKmwlG+e d.simon.ssx0@gmail.com"
  ];

  users.users.talarys.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAUAzIuK7sfr9TTOyOmWM3nm7kWZLJt0H08VLKmwlG+e d.simon.ssx0@gmail.com"
  ];

  users.users.talarys = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    hashedPassword = "$6$5LmYUUbAfFd.ru3K$aCWG8.Vw2WXtkiWFav/Z/Vu44x65oRb5TU41s.QG3nrFrACCPovyRdFuqIixo0hPAbAVY9cgr36gu6l4Kvtqt0";
    shell = pkgs.nushell;
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
    sops
    age
    ssh-to-age
  ];

  system.stateVersion = "24.11";
}
