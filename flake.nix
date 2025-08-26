{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:talarys/nvix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    with inputs; let
      lib = import ./lib {inherit inputs;};
      specialArgs = {inherit inputs self;};
    in {
      inherit (lib) formatter;
      inherit (lib) checks;
      inherit (lib) devShells;

      nixosConfigurations = {
        argos = lib.mkHost {
          hostname = "argos";
          inherit specialArgs;
          modules = [];
        };

        void = lib.mkHost {
          hostname = "void";
          inherit specialArgs;
          modules = [
            nixos-wsl.nixosModules.wsl
          ];
        };

        atlas = lib.mkHost {
          hostname = "atlas";
          inherit specialArgs;
          modules = [];
        };
      };
    };
}
