{inputs}: {
  mkHost = {
    hostname,
    system ? "x86_64-linux",
    specialArgs ? {},
    modules ? [],
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      inherit specialArgs;
      modules =
        [
          "${inputs.self}/hosts/${hostname}"
          inputs.nix-index-database.nixosModules.nix-index
          inputs.stylix.nixosModules.stylix
          {
            nixpkgs = {
              overlays = [
                (import "${inputs.self}/overlays" {inherit inputs;})
              ];
            };
          }
        ]
        ++ modules;
    };
}
