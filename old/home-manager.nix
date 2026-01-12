{
  flake.modules.homeManager.home-manager =
    { pkgs, ... }:
    {

      home.packages = with pkgs; [ home-manager ];

      programs.home-manager.enable = true;
    };

  flake.modules.nixos.home-manager = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
}
