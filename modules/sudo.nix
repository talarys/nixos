{
  flake.modules.nixos.sudo = {
    security = {
      sudo = {
        wheelNeedsPassword = false;
        extraRules = [
          {
            users = [ "talarys" ];
            commands = [
              {
                command = "ALL";
                options = [ "NOPASSWD" ];
              }
            ];
          }
        ];
      };
    };
  };
}
