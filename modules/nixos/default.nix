let
  # Read the directory and filter for .nix files
  nixFiles =
    builtins.filter
    (name: builtins.match ".*\\.nix" name != null)
    (builtins.attrNames (builtins.readDir ./.));

  # Create an attribute set from the filenames
  imports =
    builtins.listToAttrs
    (builtins.map
      (name: {
        name = builtins.replaceStrings [".nix"] [""] name;
        value = import (./. + "/${name}");
      })
      nixFiles);
in
  imports
