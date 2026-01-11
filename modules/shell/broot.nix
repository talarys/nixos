{
  flake.modules.homeManager.shell = {
    programs = {
      broot = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };
    };
  };
}
