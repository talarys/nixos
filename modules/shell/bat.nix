{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      home.shellAliases = {
        cat = "bat";
      };

      programs.bat = {
        enable = true;
        config = {
          theme = "Catppuccin Mocha";
        };
        extraPackages = with pkgs.bat-extras; [
          batgrep
          batman
          batpipe
          batwatch
          batdiff
          prettybat
        ];
      };
    };
}
