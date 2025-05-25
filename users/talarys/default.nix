{pkgs, ...}: {
  environment.shells = [pkgs.fish];
  programs.fish.enable = true;
  programs.nix-index-database.comma.enable = true;
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

  users.users.talarys = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    hashedPassword = "$6$5LmYUUbAfFd.ru3K$aCWG8.Vw2WXtkiWFav/Z/Vu44x65oRb5TU41s.QG3nrFrACCPovyRdFuqIixo0hPAbAVY9cgr36gu6l4Kvtqt0";
    shell = pkgs.fish;
  };
}
