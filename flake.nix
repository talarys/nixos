{
  inputs = {
    self.submodules = true;

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
  };

  outputs = inputs:
    with inputs; rec {
      inherit (self) outputs;

      formatter = nixpkgs.legacyPackages.${system}.alejandra;

      nixosConfigurations = {
        argos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs outputs;};
          modules = [
            ./hosts/argos
            ./users/talarys
            nix-index-database.nixosModules.nix-index
            stylix.nixosModules.stylix
          ];
        };

        void = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs outputs;};
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
