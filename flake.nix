{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.talarys = import ./users/talarys/home.nix;
              home-manager.extraSpecialArgs = {inherit inputs outputs;};
            }
          ];
        };

        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs outputs;};
          modules = [
            ./hosts/wsl
            ./users/talarys
            nix-index-database.nixosModules.nix-index
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.talarys = import ./users/talarys/home.nix;
              home-manager.extraSpecialArgs = {inherit inputs outputs;};
            }
          ];
        };
      };
    };
}
