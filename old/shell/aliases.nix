{
  flake.modules.homeManager.shell = {
    home.shellAliases = {
      cd = "z";
      grep = "rg";
      cat = "bat";
      man = "batman";

      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      npm = "bun";
      npx = "bunx";

      python = "uv run python";
    };
  };
}
