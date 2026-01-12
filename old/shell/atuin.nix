{
  flake.modules.homeManager.shell = {
    programs = {
      atuin = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };
    };
  };
}
