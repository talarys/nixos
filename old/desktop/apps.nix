{
  flake.modules.apps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        qbittorrent
        obs
        blender
      ];
    };
}
