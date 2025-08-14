{lib, ...}: let
  inherit (builtins) filter map toString;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasSuffix;
in {
  imports =
    listFilesRecursive ./.
    |> filter (p: hasSuffix ".nix" p && p != ./default.nix)
    |> map toString;
}
