{
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        $env.config.show_banner = false
      '';
      shellAliases = {
        cd = "z";
        grep = "rg";
        cat = "bat";
        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -i";
        npm = "bun";
        npx = "bunx";
      };
    };
  };
}
