{
  flake.modules.homeManager.talarys = {
    home = {
      username = "talarys";
      homeDirectory = "/home/talarys";
      stateVersion = "25.05";
      sessionVariables.NIXD_FLAGS = "-log=error";
    };
  };

  flake.modules.nixos.talarys =
    { pkgs, ... }:
    {
      users.users.talarys = {
        shell = pkgs.nushell;
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
        ];
        hashedPassword = "$6$5LmYUUbAfFd.ru3K$aCWG8.Vw2WXtkiWFav/Z/Vu44x65oRb5TU41s.QG3nrFrACCPovyRdFuqIixo0hPAbAVY9cgr36gu6l4Kvtqt0";
        extraGroups = [
          "users"
          "wheel"
          "networkmanager"
          "docker"
        ];
      };
    };
}
