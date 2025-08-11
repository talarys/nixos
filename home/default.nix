let
  # Read the directory contents
  dirContents = builtins.readDir ./.;

  # Get all .nix files (regular files ending in .nix)
  nixFiles =
    builtins.filter
    (name: dirContents.${name} == "regular" && builtins.match ".*\\.nix" name != null)
    (builtins.attrNames dirContents);

  # Get all directories that contain a default.nix
  validDirs =
    builtins.filter
    (
      name:
        dirContents.${name}
        == "directory"
        && builtins.pathExists (./. + "/${name}/default.nix")
    )
    (builtins.attrNames dirContents);

  # Combine both .nix files and valid directories
  allEntries = nixFiles ++ validDirs;

  # Create an attribute set from the entries
  imports =
    builtins.listToAttrs
    (builtins.map
      (name: {
        # Remove .nix extension if present (for files), keep directory names as-is
        name = builtins.replaceStrings [".nix"] [""] name;
        # Import works for both files and directories (with default.nix)
        value = import (./. + "/${name}");
      })
      allEntries);
in
  imports
