{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      programs = {
        btop = {
          enable = true;
          package = pkgs.btop.override {
            cudaSupport = true;
          };
          settings = {
            color_theme = "Dracula";
            theme_background = false;
            vim_keys = true;
          };
        };
      };
    };
}
