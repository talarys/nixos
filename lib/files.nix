{lib}:
with lib; {
  importFiles = dir:
    filesystem.listFilesRecursive dir
    |> (filter (file: hasSuffix ".nix" file && file != "${dir}/default.nix"));
}
