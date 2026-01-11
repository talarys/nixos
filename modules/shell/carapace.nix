{
  flake.modules.homeManager.shell = {
    programs = {
      carapace = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };
    };
  };
}
