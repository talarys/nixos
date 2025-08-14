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
          username = "talarys";
          inherit specialArgs;
          modules = [
            stylix.nixosModules.stylix
          ];
        };

        void = lib.mkHost {
          hostname = "void";
          username = "null";
          inherit specialArgs;
          modules = [
            nixos-wsl.nixosModules.wsl
            stylix.nixosModules.stylix
          ];
        };
      };
    };
}
