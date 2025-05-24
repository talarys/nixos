{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    with inputs; rec {
      inherit (self) outputs;
      username = "talarys";
      hostname = "argos";
      system = "x86_64-linux";

      packages = import ./pkgs nixpkgs.legacyPackages.${system};

      formatter = nixpkgs.legacyPackages.${system}.alejandra;

      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/${hostname}
          ./users/${username}
          nix-index-database.nixosModules.nix-index
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-backup";
            home-manager.users.${username} = import ./users/${username}/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
          }
        ];
      };
    };
}
