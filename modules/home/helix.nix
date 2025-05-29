{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
    };
    languages = {
      nix = {
        name = "nix";
        formatter = "alejandra";
        auto-format = true;
      };
    };
  };
}
