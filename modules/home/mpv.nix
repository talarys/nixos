{
  stylix.targets.mpv.enable = false;
  programs.mpv = {
    enable = true;
  };
  home.file.mpv = {
    source = ../../configs/mpv;
    target = ".config/mpv";
  };
}
