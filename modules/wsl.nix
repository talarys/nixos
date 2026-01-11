{
  modules.nixos.wsl =
    { inputs }:
    {
      imports = [ inputs.nixos-wsl.nixosModules.wsl ];
      wsl = {
        enable = true;
        defaultUser = "talarys";
        docker-desktop.enable = true;
      };
    };
}
