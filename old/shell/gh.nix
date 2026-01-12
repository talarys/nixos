{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      programs = {
        gh = {
          enable = true;
          extensions = [
            pkgs.gh-dash
            pkgs.gh-copilot
          ];
        };

        gh-dash = {
          enable = true;
        };
      };
    };
}
