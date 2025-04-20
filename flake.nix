{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    with inputs; rec {
      configurationDefaults = args: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "hm-backup";
        home-manager.extraSpecialArgs = args;
      };

      argDefaults = {
        inherit inputs self nix-index-database;
        channels = {inherit nixpkgs;};
        inherit username;
        inherit hostname;
      };

      username = "talarys";
      hostname = "nixos";

      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = argDefaults;
        modules = [
          (configurationDefaults argDefaults)
          home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.wsl
          ./wsl.nix
        ];
      };
    };
}
