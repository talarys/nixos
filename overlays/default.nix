{ inputs, ... }:
_final: prev: {
  lib = inputs.nixpkgs.lib // import "${inputs.self}/lib" { inherit inputs; };
  faugus-launcher = prev.callPackage ./faugus-launcher.nix { };
  pokego = prev.callPackage ./pokego.nix { };
  neovim = inputs.nixcats.packages.${prev.system}.default;
}
