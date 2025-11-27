{ inputs, ... }:
rec {
  inherit (inputs) lib;
  inherit (import ./eachSystem.nix { inherit inputs; }) eachSystem;
  inherit (import ./treefmt.nix { inherit inputs eachSystem; }) treefmtEval;
  inherit (import ./mkHost.nix { inherit inputs; }) mkHost;

  formatter = eachSystem (pkgs: treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.wrapper);

  checks = eachSystem (pkgs: {
    formatting = treefmtEval.${pkgs.stdenv.hostPlatform.system}.config.build.check inputs.self;
  });
}
