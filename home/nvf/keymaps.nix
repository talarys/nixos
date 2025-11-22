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
      (mkKeymap "v" "<c-s>" "<esc>:w<cr>" "Saving File")

      (mkKeymap "i" "jk" "<esc>" "Normal Mode")
      (mkKeymap "i" "jj" "<esc>" "Normal Mode")
      (mkKeymap "i" "<c-s>" "<esc>:w ++p<cr>" "Save file")

      (mkKeymap "n" "<c-a-h>" ":lua require('smart-splits').resize_left()<cr>" "Resize Left")
      (mkKeymap "n" "<c-a-j>" ":lua require('smart-splits').resize_down()<cr>" "Resize Down")
      (mkKeymap "n" "<c-a-k>" ":lua require('smart-splits').resize_up()<cr>" "Resize Up")
      (mkKeymap "n" "<c-a-l>" ":lua require('smart-splits').resize_right()<cr>" "Resize Right")
      (mkLuaKeymap "n" "?"
        # lua
        ''
          function()
            require('flash').jump({
              forward = true, wrap = true, multi_window = true
            })
            end
        ''
        "Flash Search"
      )

      (mkKeymap "n" "<c-h>" ":lua require('smart-splits').move_cursor_left()<cr>" "Move Cursor Left")
      (mkKeymap "n" "<c-j>" ":lua require('smart-splits').move_cursor_down()<cr>" "Move Cursor Down")
      (mkKeymap "n" "<c-k>" ":lua require('smart-splits').move_cursor_up()<cr>" "Move Cursor Up")
      (mkKeymap "n" "<c-l>" ":lua require('smart-splits').move_cursor_right()<cr>" "Move Cursor Right")
      (mkKeymap "n" "<c-\\>" ":lua require('smart-splits').move_cursor_previous()<cr>"
        "Move Cursor Previous"
      )

      (mkKeymap "n" "<c-s>" "<cmd>w ++p<cr>" "Save the file")
      (mkKeymap "n" "<a-+>" "<C-a>" "Increase Number")
      (mkKeymap "n" "<a-->" "<C-x>" "Decrease Number")

      (mkKeymap "n" "<leader>qq" "<cmd>quitall!<cr>" "Quit!")
      (mkLuaKeymap "n" "<leader>qw"
        # lua
        ''
          function()
            local wins = vim.api.nvim_tabpage_list_wins(0)
            if #wins > 1 then
                local ok, err = pcall(vim.cmd, 'close')
                if not ok then
                    vim.notify("Cannot close the last window!", vim.log.levels.WARN)
                end
            else
                vim.notify("Cannot close the last window!", vim.log.levels.WARN)
            end
          end
        ''
        "Close Window!"
      )

      (mkKeymap "n" "<esc><esc>" "<cmd>nohl<cr>" "no highlight!")
      (mkKeymap "n" "<esc>" "<esc>:nohlsearch<cr>" "escape")
      (mkKeymap "n" "<leader>A" "ggVG" "select All")

      (mkKeymap "n" "<leader>|" "<cmd>vsplit<cr>" "vertical split")
      (mkKeymap "n" "<leader>-" "<cmd>split<cr>" "horizontal split")

      # quickfix
      (mkKeymap "n" "<leader>cn" "<cmd>cnext<cr>" "quickfix next")
      (mkKeymap "n" "<leader>cp" "<cmd>cprev<cr>" "quickfix prev")
      (mkKeymap "n" "<leader>cq" "<cmd>cclose<cr>" "quit quickfix")
    ];
  };
}
