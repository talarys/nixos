{
  flake.modules.homeManager.shell = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
