{ inputs, ... }:
let
  system = inputs.pkgs.stdenv.hostPlatform.system;
in
rec {
  inherit (inputs) lib;
  inherit (import ./eachSystem.nix { inherit inputs; }) eachSystem;
  inherit (import ./treefmt.nix { inherit inputs eachSystem; }) treefmtEval;
  inherit (import ./mkHost.nix { inherit inputs; }) mkHost;

  formatter = eachSystem (pkgs: treefmtEval.${system}.config.build.wrapper);

  checks = eachSystem (pkgs: {
    formatting = treefmtEval.${system}.config.build.check inputs.self;
  });

  devShells = eachSystem (pkgs: {
    default = import ./dev-shell.nix {
      inherit inputs;
      inherit (pkgs) system;
    };
  });
}
