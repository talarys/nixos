let
  mkKeymap = mode: key: action: desc: {
    inherit
      mode
      key
      action
      desc
      ;
  };
  mkLuaKeymap = mode: key: action: desc: {
    lua = true;
    inherit
      mode
      key
      action
      desc
      ;
  };
in
{
  programs.nvf.settings.vim = {
    globals.mapleader = " ";
    binds = {
      whichKey = {
        enable = true;
        register = { };
      };
    };
    keymaps = [
      (mkKeymap "n" "<leader>lO" "<cmd>lua require('otter').activate()<cr>" "Force Otter")

      # Lspsaga
      (mkKeymap "n" "<leader>la" "<cmd>:Lspsaga code_action<cr>" "Code Action")
      (mkKeymap "n" "<leader>lo" "<cmd>Lspsaga outline<cr>" "Outline")
      (mkKeymap "n" "<leader>lw" "<cmd>Lspsaga show_workspace_diagnostics<cr>" "Workspace Diagnostics")
      (mkKeymap "n" "gd" "<cmd>Lspsaga goto_definition<cr>" "Definitions")
      (mkKeymap "n" "<leader>lr" "<cmd>Lspsaga rename ++project<cr>" "Rename")
      (mkKeymap "n" "gt" "<cmd>Lspsaga goto_type_definition<cr>" "Type Definitions")
      (mkKeymap "n" "<leader>l." "<cmd>Lspsaga show_line_diagnostics<cr>" "Line Diagnostics")
      (mkKeymap "n" "gpd" "<cmd>Lspsaga peek_definition<cr>" "Peek Definition")
      (mkKeymap "n" "gpt" "<cmd>Lspsaga peek_type_definition<cr>" "Peek Type Definition")
      (mkKeymap "n" "[e" "<cmd>Lspsaga diagnostic_jump_prev<cr>" "Jump Prev Diagnostic")
      (mkKeymap "n" "]e" "<cmd>Lspsaga diagnostic_jump_next<cr>" "Jump Next Diagnostic")
      (mkLuaKeymap "n" "K" ''
        function()
          local ok, ufo = pcall(require, "ufo")
          if ok then
            winid = ufo.peekFoldedLinesUnderCursor()
          end
          if not winid then
            vim.cmd("Lspsaga hover_doc")
          end
        end
      '' "Hover Doc")

      # UFO
      (mkLuaKeymap "n" "zR"
        # lua
        ''
          function()
            require("ufo").openAllFolds()
          end
        ''
        "Open all folds"
      )
      (mkLuaKeymap "n" "zM"
        # lua
        ''
          function()
            require("ufo").closeAllFolds()
          end
        ''
        "Close All Folds"
      )
      (mkLuaKeymap "n" "zK"
        # lua
        ''
          function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
              vim.lsp.buf.hover()
            end
          end
        ''
        "Peek Folded Lines"
      )

      (mkKeymap "n" "<leader>lq" "<CMD>LspStop<Enter>" "Stop LSP")
      (mkKeymap "n" "<leader>li" "<cmd>LspInfo<cr>" "LSP Info")
      (mkKeymap "n" "<leader>ls" "<CMD>LspStart<Enter>" "Start LSP")
      (mkKeymap "n" "<leader>lR" "<CMD>LspRestart<Enter>" "Restart LSP")

      (mkKeymap "n" "<C-s-k>" "<cmd>:lua vim.lsp.buf.signature_help()<cr>" "Signature Help")
      (mkKeymap "n" "<leader>lD" "<cmd>:lua Snacks.picker.lsp_definitions()<cr>" "Definitions list")
      (mkKeymap "n" "<leader>ls" "<cmd>:lua Snacks.picker.lsp_symbols()<cr>" "Definitions list")

      (mkKeymap "n" "<leader>lf" "<cmd>:lua require('conform').format()<cr>" "Format file")
      (mkKeymap "x" "<leader>lf" "<cmd>:lua require('conform').format()<cr>" "Format File")
      (mkKeymap "v" "<leader>lf" "<cmd>:lua require('conform').format()<cr>" "Format File")

      (mkKeymap "n" "[d" "<cmd>:lua vim.diagnostic.goto_prev()<cr>" "Previous Diagnostic")
      (mkKeymap "n" "]d" "<cmd>:lua vim.diagnostic.goto_next()<cr>" "Next Diagnostic")
      (mkLuaKeymap "n" "<leader>lL"
        # lua
        ''
          function()
            if vim.g.diagnostics_visible == nil or vim.g.diagnostics_visible then
              vim.g.diagnostics_visible = false
              vim.diagnostic.disable()
            else
              vim.g.diagnostics_visible = true
              vim.diagnostic.enable()
            end
          end
        ''
        "Toggle Diagnostics"
      )
      (mkLuaKeymap "n" "<leader>ll"
        # lua
        ''
          function()
            if vim.diagnostic.config().virtual_text == false then
              vim.diagnostic.config({ virtual_text = { source = "always" } })
            else
              vim.diagnostic.config({ virtual_text = false })
            end
          end
        ''
        "Toggle Virtual Text"
      )
    ];
  };
}
