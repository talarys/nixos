{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        deadnix.enable = true;
        statix.enable = true;
        keep-sorted.enable = true;
        nixfmt.enable = true;
        prettier.enable = true;
        shfmt.enable = true;
        yamlfmt.enable = true;
      };
      settings = {
        on-unmatched = "warn";
        global.excludes = [
          "*.jpg"
          "*.png"
          "*.toml"
          "*/.gitignore"
          "*karabiner/**"
          "LICENSE"
          "envdis"
          "modules/_scripts/*"
        ];
        formatter = {
          deadnix = {
            priority = 1;
          };
          statix = {
            priority = 2;
          };
          keep-sorted = {
            priority = 3;
          };
          nixfmt = {
            priority = 4;
          };
        };
      };
    };
    pre-commit.settings.hooks.treefmt.enable = false;
  };
}
