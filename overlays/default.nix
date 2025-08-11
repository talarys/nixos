{inputs, ...}: _final: prev: {
  faugus-launcher = prev.callPackage ./faugus-launcher.nix {};
  pokego = prev.callPackage ./pokego.nix {};
  neovim = inputs.nixvim.packages.${prev.system}.default;
  lib = inputs.nixpkgs.lib // import "${inputs.self}/lib" {inherit inputs;};
}
