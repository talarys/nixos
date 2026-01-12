{
  flake.modules.homeManager.shell = {
    programs = {
      lazygit = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };
    };
  };
}
