{
  pkgs,
  ...
}:
{
  programs.nvf.settings.vim = {
    syntaxHighlighting = true;
    treesitter = {
      enable = true;
      autotagHtml = true;
      context.enable = true;
      highlight.enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        typescript # in language settings only tsx gets enabled, not typescript
      ];
    };
    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      gleam.enable = true;
      go.enable = true;
      html.enable = true;
      lua.enable = true;
      nix.enable = true;
      nu.enable = true;
      python.enable = true;
      rust.enable = true;
      svelte.enable = true;
      tailwind.enable = true;
      zig.enable = true;

      haskell = {
        enable = true;
        dap.enable = false;
      };

      markdown = {
        enable = true;
        format.type = "prettierd";
        extensions = {
          markview-nvim = {
            enable = true;
          };
        };
        extraDiagnostics.enable = true;
      };

      ts = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };

    };

    formatter = {
      conform-nvim = {
        enable = true;
      };
    };
  };
}
