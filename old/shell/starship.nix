{
  flake.modules.homeManager.shell = {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
