{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    with inputs; rec {
      inherit (self) outputs;
      username = "talarys";
      hostname = "argos";
      system = "x86_64-linux";

      # configurationDefaults = args: {
      #   home-manager.useGlobalPkgs = true;
      #   home-manager.useUserPackages = true;
      #   home-manager.backupFileExtension = "hm-backup";
      #   home-manager.extraSpecialArgs = args;
      # };

      packages = import ./pkgs nixpkgs.legacyPackages.${system};

      formatter = nixpkgs.legacyPackages.${system}.alejandra;

      overlays = import ./overlays {inherit inputs;};

      nixosModules = import ./modules/nixos;

      homeManagerModules = import ./modules/home;

      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs outputs;};
        modules = [
          # (configurationDefaults {inherit inputs outputs;})
          # home-manager.nixosModules.home-manager
          ./hosts/${hostname}
          ./users/${username}
        ];
      };
    };
}
