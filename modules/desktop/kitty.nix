{
  flake.modules.homeManager.kitty = {
    programs.kitty = {
      enable = true;
      settings = {
        font-family = "JetBrains Mono Nerd Font";
        font_size = 12;
        background-opacity = 0.9;
        theme = "catppuccin-mocha";
      };
    };
  };
}
