{
  inputs,
  eachSystem,
}: {
  treefmtEval = eachSystem (pkgs:
    inputs.treefmt-nix.lib.evalModule pkgs
    {
      projectRootFile = "flake.nix";
      programs = {
        alejandra.enable = true;
        deadnix.enable = true;
        statix.enable = true;
        keep-sorted.enable = true;
      };
      settings = {
        global.excludes = [
          "LICENSE"
          "README.md"
          ".adr-dir"
          "nu_scripts"
          "*.{gif,png,svg,tape,mts,lock,mod,sum,toml,env,envrc,gitignore,sql,conf,pem,*.so.2,key,pub,py,narHash}"
          "data-mesher/test/networks/*"
          "nss-datamesher/test/dns.json"
          "*.age"
          "*.jpg"
          "*.nu"
          "*.png"
          ".jj/*"
          "Cargo.lock"
          "flake.lock"
          "hive/moonrise/borg-key-backup"
          "justfile"
        ];
        formatter = {
          deadnix = {
            priority = 1;
          };
          statix = {
            priority = 2;
          };
          keep-sorted = {
            priority = 3;
          };
          alejandra = {
            priority = 4;
          };
        };
      };
    });
}
