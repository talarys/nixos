{pkgs, ...}: {
  programs.mpv = {
    enable = true;
  };
  home.file.mpv = {
    source = pkgs.fetchgit {
      url = "https://github.com/talarys/mpv_config.git";
      rev = "eng";
      sha256 = "066cfe27c72422ec42f7e34b0847c308e49fcda8";
    };
    target = ".config/mpv";
  };
}
