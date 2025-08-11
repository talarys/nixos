{
  self,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.talarys = import ./home.nix;
    extraSpecialArgs = {inherit inputs self;};
  };

  environment.shells = with pkgs; [bash fish];
  programs.fish.enable = true;
  programs.nix-index-database.comma.enable = true;

  programs.nh.flake = "/home/talarys/nixos";

  users.users.talarys = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    hashedPassword = "$6$5LmYUUbAfFd.ru3K$aCWG8.Vw2WXtkiWFav/Z/Vu44x65oRb5TU41s.QG3nrFrACCPovyRdFuqIixo0hPAbAVY9cgr36gu6l4Kvtqt0";
    shell = pkgs.fish;
  };
}
