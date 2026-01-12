{
  flake.modules.homeManager.ghostty = {
    programs = {
      ghostty = {
        enable = true;
        enableFishIntegration = true;
        settings = {
          font-family = "JetBrains Mono Nerd Font";
          font-size = 12;
          background-opacity = 0.9;
          theme = "catppuccin-mocha";
        };
      };
      kitty = {
        enable = true;
        shellIntegration.enableFishIntegration = true;
        settings = {
          font-family = "JetBrains Mono Nerd Font";
          font_size = 12;
          background-opacity = 0.9;
          theme = "catppuccin-mocha";
        };
      };
    };
  };
}
