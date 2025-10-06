{ lib, ... }:
let
  inherit (builtins) listToAttrs baseNameOf filter;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasSuffix removeSuffix;
in
lib.pipe ./. [
  listFilesRecursive
  (filter (p: hasSuffix ".nix" p && p != ./default.nix))
  (map (p: {
    name = removeSuffix ".nix" (baseNameOf p);
    value = p;
  }))
  listToAttrs
]
