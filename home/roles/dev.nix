{ lib, ... }:
let
  modules = import ../default.nix { inherit lib; };
in
{
  imports = with modules; [
    yazi
    aliases
    git
    helix
    nushell
    cli-tools
    packages
  ];
}
