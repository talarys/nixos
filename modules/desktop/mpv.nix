{
  flake.modules.homeManager.mpv =
    { pkgs, ... }:
    {
      programs.mpv = {
        enable = true;
      };
      home.file.mpv = {
        source = pkgs.fetchgit {
          url = "https://github.com/talarys/mpv-config.git";
          rev = "eng";
        };
        target = ".config/mpv";
      };
    };
}
