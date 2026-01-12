{
  flake.modules.homeManager.shell = {
    programs = {
      pay-respects = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };
    };
  };
}
