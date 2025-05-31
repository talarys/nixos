{inputs, ...}: [
  (
    final: prev: {
      faugus-launcher = prev.callPackage ./faugus-launcher.nix {};
      neovim = inputs.nixvim.packages.${prev.system}.default;
    }
  )
]
