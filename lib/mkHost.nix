{inputs}: {
  mkHost = {
    hostname,
    username,
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
          "${inputs.self}/users/${username}"
          inputs.nix-index-database.nixosModules.nix-index
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
