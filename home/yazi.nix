{self, ...}: {
  home.file.yazi = {
    source = "${self}/config/yazi";
    target = ".config/yazi";
  };
  programs = {
    yazi = {
      #TODO yazi.flavours
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
