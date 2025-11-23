{
  programs.nvf.settings.vim = {
    assistant.copilot.enable = true;

    utility = {
      motion.flash-nvim.enable = true;
      smart-splits.enable = true;
    };

    notes.todo-comments.enable = true;

    statusline.lualine.enable = true;

    # tabline.nvimBufferline.enable = true;

    autocomplete = {
      blink-cmp.enable = true;
    };

    binds.whichKey = {
      enable = true;
      setupOpts = {
        preset = "helix";
      };
    };

    snippets.luasnip.enable = true;

    ui = {
      noice.enable = true;
      colorizer.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
    };

    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        mappings.open = "<leader>t";
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      rainbow-delimiters.enable = true;
    };
  };
}
