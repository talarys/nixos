{...}: [
  (
    final: prev: {
      faugus-launcher = prev.callPackage ./faugus-launcher.nix {};
    }
  )
]
