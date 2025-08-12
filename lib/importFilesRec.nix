{inputs, ...}:
with inputs.lib; let
  # Function to recursively import .nix files from a directory
  # and create a nested attribute set based on the folder structure
  importFilesRec = dir: let
    # Get all entries in the directory
    entries = builtins.readDir dir;

    # Filter for directories and .nix files
    dirs = filterAttrs (_name: type: type == "directory") entries;
    nixFiles = filterAttrs (name: type: type == "regular" && hasSuffix ".nix" name) entries;

    # Process directories recursively
    dirAttrs =
      mapAttrs'
      (name: _: {
        name = removeSuffix ".nix" name;
        value = importFilesRec (dir + "/${name}");
      })
      dirs;

    # Process .nix files
    fileAttrs =
      mapAttrs'
      (name: _: {
        name = removeSuffix ".nix" name;
        value = import (dir + "/${name}");
      })
      nixFiles;

    # Check if there's a default.nix in this directory
    hasDefault = entries ? "default.nix" && entries."default.nix" == "regular";
    defaultAttr =
      if hasDefault
      then {
        default = import (dir + "/default.nix");
      }
      else {};

    # Combine all attributes
    allAttrs = dirAttrs // fileAttrs // defaultAttr;

    # If there's a default.nix and other files, we want to merge the default.nix content
    # with the other attributes, but if there's only a default.nix, we just return its content
    result =
      if hasDefault
      then
        if (builtins.length (builtins.attrNames allAttrs)) == 1
        then allAttrs.default
        else allAttrs // {inherit (allAttrs.default) __unfix__;}
      else allAttrs;
  in
    result;
in
  # Import all .nix files from the current directory (.)
  importFilesRec ./.
