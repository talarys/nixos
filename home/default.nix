{ lib, ... }:
let
  inherit (builtins)
    listToAttrs
    baseNameOf
    filter
    map
    pathExists
    ;

  inherit (lib.filesystem)
    listFilesRecursive
    pathType
    ;

  inherit (lib.strings)
    hasSuffix
    removeSuffix
    ;

  fileModules = lib.pipe ./. [
    listFilesRecursive
    (filter (p: hasSuffix ".nix" p && p != ./default.nix))
    (map (p: {
      name = removeSuffix ".nix" (baseNameOf p);
      value = p;
    }))
    listToAttrs
  ];

  dirModules = lib.pipe ./. [
    listFilesRecursive
    (filter (p: pathType p == "directory"))
    (filter (dir: pathExists (dir + "/default.nix")))
    (map (dir: {
      name = baseNameOf dir;
      value = dir;
    }))
    listToAttrs
  ];

in
fileModules // dirModules
