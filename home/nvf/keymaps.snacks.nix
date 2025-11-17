{ lib, ... }:
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
  inherit (lib.generators) mkLuaInline;
in
{
  programs.nvf.settings.vim = {
    keymaps = [
      # -- Top Pickers & Explorer
      (mkKeymap "n" "<leader><space>" ":lua Snacks.picker.smart()<cr>" "Smart Find Files")
      (mkKeymap "n" "<leader>," ":lua Snacks.picker.buffers()<cr>" "Buffers")
      (mkKeymap "n" "<leader>/" ":lua Snacks.picker.grep()<cr>" "Grep")
      (mkKeymap "n" "<leader>:" ":lua Snacks.picker.command_history()<cr>" "Command History")
      (mkKeymap "n" "<leader>n" ":lua Snacks.picker.notifications()<cr>" "Notification History")
      (mkKeymap "n" "<leader>e" ":lua Snacks.explorer()<cr>" "File Explorer")
      # -- find
      (mkKeymap "n" "<leader>fb" ":lua Snacks.picker.buffers()<cr>" "Buffers")
      (mkKeymap "n" "<leader>fc" ":lua Snacks.picker.files({ cwd = vim.fn.stdpath(\"config\") })<cr>"
        "Find Config File"
      )
      (mkKeymap "n" "<leader>ff" ":lua Snacks.picker.files()<cr>" "Find Files")
      (mkKeymap "n" "<leader>fg" ":lua Snacks.picker.git_files()<cr>" "Find Git Files")
      (mkKeymap "n" "<leader>fp" ":lua Snacks.picker.projects()<cr>" "Projects")
      (mkKeymap "n" "<leader>fr" ":lua Snacks.picker.recent()<cr>" "Recent")
      # -- git
      (mkKeymap "n" "<leader>gb" ":lua Snacks.picker.git_branches()<cr>" "Git Branches")
      (mkKeymap "n" "<leader>gl" ":lua Snacks.picker.git_log()<cr>" "Git Log")
      (mkKeymap "n" "<leader>gL" ":lua Snacks.picker.git_log_line()<cr>" "Git Log Line")
      (mkKeymap "n" "<leader>gs" ":lua Snacks.picker.git_status()<cr>" "Git Status")
      (mkKeymap "n" "<leader>gS" ":lua Snacks.picker.git_stash()<cr>" "Git Stash")
      (mkKeymap "n" "<leader>gd" ":lua Snacks.picker.git_diff()<cr>" "Git Diff (Hunks)")
      (mkKeymap "n" "<leader>gf" ":lua Snacks.picker.git_log_file()<cr>" "Git Log File")
      # -- gh
      (mkKeymap "n" "<leader>gi" ":lua Snacks.picker.gh_issue()<cr>" "GitHub Issues (open)")
      (mkKeymap "n" "<leader>gI" ":lua Snacks.picker.gh_issue({ state = \"all\" })<cr>"
        "GitHub Issues (all)"
      )
      (mkKeymap "n" "<leader>gp" ":lua Snacks.picker.gh_pr()<cr>" "GitHub Pull Requests (open)")
      (mkKeymap "n" "<leader>gP" ":lua Snacks.picker.gh_pr({ state = \"all\" })<cr>"
        "GitHub Pull Requests (all)"
      )
      # -- Grep
      (mkKeymap "n" "<leader>sb" ":lua Snacks.picker.lines()<cr>" "Buffer Lines")
      (mkKeymap "n" "<leader>sB" ":lua Snacks.picker.grep_buffers()<cr>" "Grep Open Buffers")
      (mkKeymap "n" "<leader>sg" ":lua Snacks.picker.grep()<cr>" "Grep")
      (mkKeymap "n" "<leader>sw" ":lua Snacks.picker.grep_word()<cr>" "Visual selection or word")
      # -- search
      (mkKeymap "n" "<leader>sr" ":lua Snacks.picker.registers()<cr>" "Registers")
      (mkKeymap "n" "<leader>s/" ":lua Snacks.picker.search_history()<cr>" "Search History")
      (mkKeymap "n" "<leader>sa" ":lua Snacks.picker.autocmds()<cr>" "Autocmds")
      (mkKeymap "n" "<leader>sb" ":lua Snacks.picker.lines()<cr>" "Buffer Lines")
      (mkKeymap "n" "<leader>sc" ":lua Snacks.picker.command_history()<cr>" "Command History")
      (mkKeymap "n" "<leader>sC" ":lua Snacks.picker.commands()<cr>" "Commands")
      (mkKeymap "n" "<leader>sd" ":lua Snacks.picker.diagnostics()<cr>" "Diagnostics")
      (mkKeymap "n" "<leader>sD" ":lua Snacks.picker.diagnostics_buffer()<cr>" "Buffer Diagnostics")
      (mkKeymap "n" "<leader>sh" ":lua Snacks.picker.help()<cr>" "Help Pages")
      (mkKeymap "n" "<leader>sH" ":lua Snacks.picker.highlights()<cr>" "Highlights")
      (mkKeymap "n" "<leader>si" ":lua Snacks.picker.icons()<cr>" "Icons")
      (mkKeymap "n" "<leader>sj" ":lua Snacks.picker.jumps()<cr>" "Jumps")
      (mkKeymap "n" "<leader>sk" ":lua Snacks.picker.keymaps()<cr>" "Keymaps")
      (mkKeymap "n" "<leader>sl" ":lua Snacks.picker.loclist()<cr>" "Location List")
      (mkKeymap "n" "<leader>sm" ":lua Snacks.picker.marks()<cr>" "Marks")
      (mkKeymap "n" "<leader>sM" ":lua Snacks.picker.man()<cr>" "Man Pages")
      (mkKeymap "n" "<leader>sp" ":lua Snacks.picker.lazy()<cr>" "Search for Plugin Spec")
      (mkKeymap "n" "<leader>sq" ":lua Snacks.picker.qflist()<cr>" "Quickfix List")
      (mkKeymap "n" "<leader>sR" ":lua Snacks.picker.resume()<cr>" "Resume")
      (mkKeymap "n" "<leader>su" ":lua Snacks.picker.undo()<cr>" "Undo History")
      (mkKeymap "n" "<leader>uC" ":lua Snacks.picker.colorschemes()<cr>" "Colorschemes")
      # -- LSP
      (mkKeymap "n" "gd" ":lua Snacks.picker.lsp_definitions()<cr>" "Goto Definition")
      (mkKeymap "n" "gD" ":lua Snacks.picker.lsp_declarations()<cr>" "Goto Declaration")
      (mkKeymap "n" "gr" ":lua Snacks.picker.lsp_references()<cr>" "References")
      (mkKeymap "n" "gI" ":lua Snacks.picker.lsp_implementations()<cr>" "Goto Implementation")
      (mkKeymap "n" "gy" ":lua Snacks.picker.lsp_type_definitions()<cr>" "Goto Type Definition")
      (mkKeymap "n" "gai" ":lua Snacks.picker.lsp_incoming_calls()<cr>" "Calls Incoming")
      (mkKeymap "n" "gao" ":lua Snacks.picker.lsp_outgoing_calls()<cr>" "Calls Outgoing")
      (mkKeymap "n" "<leader>ss" ":lua Snacks.picker.lsp_symbols()<cr>" "LSP Symbols")
      (mkKeymap "n" "<leader>sS" ":lua Snacks.picker.lsp_workspace_symbols()<cr>" "LSP Workspace Symbols")
      # -- Other
      (mkKeymap "n" "<leader>z" ":lua Snacks.zen()<cr>" "Toggle Zen Mode")
      (mkKeymap "n" "<leader>Z" ":lua Snacks.zen.zoom()<cr>" "Toggle Zoom")
      (mkKeymap "n" "<leader>." ":lua Snacks.scratch()<cr>" "Toggle Scratch Buffer")
      (mkKeymap "n" "<leader>S" ":lua Snacks.scratch.select()<cr>" "Select Scratch Buffer")
      (mkKeymap "n" "<leader>n" ":lua Snacks.notifier.show_history()<cr>" "Notification History")
      (mkKeymap "n" "<leader>bd" ":lua Snacks.bufdelete()<cr>" "Delete Buffer")
      (mkKeymap "n" "<leader>cR" ":lua Snacks.rename.rename_file()<cr>" "Rename File")
      (mkKeymap "n" "<leader>gB" ":lua Snacks.gitbrowse()<cr>" "Git Browse")
      (mkKeymap "n" "<leader>gg" ":lua Snacks.lazygit()<cr>" "Lazygit")
      (mkKeymap "n" "<leader>un" ":lua Snacks.notifier.hide()<cr>" "Dismiss All Notifications")
      (mkKeymap "n" "<c-/>" ":lua Snacks.terminal()<cr>" "Toggle Terminal")
      (mkKeymap "n" "<c-_>" ":lua Snacks.terminal()<cr>" "which_key_ignore")
      (mkKeymap "n" "]]" ":lua Snacks.words.jump(vim.v.count1)<cr>" "Next Reference")
      (mkKeymap "n" "[[" ":lua Snacks.words.jump(-vim.v.count1)<cr>" "Prev Reference")

      (mkKeymap "n" "<leader>sP" "<cmd>:lua Snacks.picker()<cr>" "Pickers")
      (mkKeymap "n" "<leader>st" "<cmd>:lua Snacks.picker.todo_comments({layout = 'ivy'})<cr>" "Todo")
      (mkKeymap "n" "<leader>sT"
        ''<cmd>:lua Snacks.picker.todo_comments({keywords = {"TODO", "FIX", "FIXME"}, layout = 'ivy'})<cr>''
        "Todo"
      )
      (mkLuaKeymap "n" "<leader>su"
        # lua
        ''
          function()
            Snacks.picker.undo({
              win = {
                input = {
                  keys = {
                    ["y"] = { "yank_add", mode =  "n" },
                    ["Y"] = { "yank_del", mode =  "n" },
                  },
                },
              },
            })
          end
        ''
        "Undo"
      )
    ];
    autocmds = [
      {
        event = [ "VimEnter" ];
        pattern = [ "*" ];
        callback = mkLuaInline ''
          function()
            Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
            Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
            Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
            Snacks.toggle.diagnostics():map("<leader>ud")
            Snacks.toggle.line_number():map("<leader>ul")
            Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
            Snacks.toggle.treesitter():map("<leader>uT")
            Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
            Snacks.toggle.inlay_hints():map("<leader>uh")
            Snacks.toggle.indent():map("<leader>ug")
            Snacks.toggle.dim():map("<leader>uD")
          end
        '';
        desc = "Setup Toggle Keymaps";
      }
    ];
  };
}
