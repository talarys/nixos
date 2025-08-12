{inputs}: rec {
  inherit (inputs) lib;
  inherit (import ./eachSystem.nix {inherit inputs;}) eachSystem;
  inherit (import ./treefmt.nix {inherit inputs eachSystem;}) treefmtEval;
  inherit (import ./mkHost.nix {inherit inputs;}) mkHost;
  inherit (import ./importFilesRec.nix {inherit inputs;}) importFilesRec;

  formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);

  checks = eachSystem (pkgs: {
    formatting = treefmtEval.${pkgs.system}.config.build.check inputs.self;
  });

  devShells = eachSystem (pkgs: {
    default = import ./dev-shell.nix {
      inherit inputs;
      inherit (pkgs) system;
    };
  });
}
