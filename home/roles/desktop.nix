{ lib, ... }:
let
  modules = import ../default.nix { inherit lib; };
in
{
  imports = with modules; [
    browsers
    kitty
    mpv
    programs
  ];
}
