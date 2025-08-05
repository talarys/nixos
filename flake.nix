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

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:talarys/nvix";

    treefmt-nix.url = "github:numtide/treefmt-nix";

    systems.url = "github:nix-systems/default";
  };

  outputs = inputs:
    with inputs; let
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in rec {
      inherit (self) outputs;

      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);

      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });

      devShells = eachSystem (pkgs: {
        default = import ./dev-shell.nix {
          inherit inputs;
          inherit (pkgs) system;
        };
      });

      nixosConfigurations = {
        argos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs outputs self;};
          modules = [
            ./hosts/argos
            ./users/talarys
            nix-index-database.nixosModules.nix-index
            stylix.nixosModules.stylix
          ];
        };

        void = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs outputs self;};
          modules = [
            ./hosts/void
            ./users/null
            nix-index-database.nixosModules.nix-index
            nixos-wsl.nixosModules.wsl
          ];
        };
      };
    };
}
