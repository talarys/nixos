{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      servers.nixd.settings.nil.nix.autoArchive = true;
      otter-nvim = {
        enable = true;
        setupOpts = {
          buffers.set_filetype = true;
          lsp = {
            diagnostic_update_event = [
              "BufWritePost"
              "InsertLeave"
            ];
          };
        };
      };
      lspkind.enable = true;
      lspsaga = {
        enable = true;
        setupOpts = {
          ui = {
            code_action = "";
          };
          lightbulb = {
            sign = false;
            virtual_text = true;
          };
          breadcrumbs.enable = false;
        };
      };
    };
  };
}
