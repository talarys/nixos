{lib, ...}: let
  inherit (builtins) filter;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasSuffix;
in {
  imports = lib.pipe ./. [
    listFilesRecursive
    (filter (p: hasSuffix ".nix" p && p != ./default.nix))
  ];
}
