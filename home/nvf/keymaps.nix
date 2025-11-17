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
      (mkKeymap "v" "<c-c>" "<esc>" "Escape")
      (mkKeymap "v" "<a-j>" ":m '>+1<cr>gv-gv" "Move Selected Line Down")
      (mkKeymap "v" "<a-k>" ":m '<lt>-2<CR>gv-gv" "Move Selected Line Up")
      (mkKeymap "v" "<" "<gv" "Indent out")
      (mkKeymap "v" ">" ">gv" "Indent in")
      (mkKeymap "v" "<space>" "<Nop>" "Mapped to Nothing")

      (mkKeymap "i" "jk" "<esc>" "Normal Mode")
      (mkKeymap "i" "jj" "<esc>" "Normal Mode")
      (mkKeymap "i" "<c-s>" "<esc>:w ++p<cr>" "Save file")
      (mkKeymap "i" "<a-j>" "<esc>:m .+1<cr>==gi" "Move Line Down")
      (mkKeymap "i" "<a-k>" "<esc>:m .-2<cr>==gi" "Move Line Up")

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
      (mkLuaKeymap "n" "<leader>dd"
        # lua
        ''
          function()
            local any_diff = false
            for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
              if vim.api.nvim_win_get_option(w, "diff") then
                any_diff = true
                break
              end
            end

            if any_diff then
              vim.cmd("windo diffoff")
            else
              vim.cmd("windo diffthis")
            end
          end
        ''
        "Toggle Diff the opened windows"
      )

      (mkKeymap "n" "<c-s>" "<cmd>w ++p<cr>" "Save the file")
      (mkKeymap "n" "<a-+>" "<C-a>" "Increase Number")
      (mkKeymap "n" "<a-->" "<C-x>" "Decrease Number")

      (mkKeymap "n" "<a-j>" "<cmd>m .+1<cr>==" "Move line Down")
      (mkKeymap "n" "<a-k>" "<cmd>m .-2<cr>==" "Move line up")

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

      (mkKeymap "n" "<leader><leader>" "<cmd>nohl<cr>" "no highlight!")
      (mkKeymap "n" "<esc>" "<esc>:nohlsearch<cr>" "escape")
      (mkKeymap "n" "<leader>A" "ggVG" "select All")

      (mkKeymap "n" "<leader>|" "<cmd>vsplit<cr>" "vertical split")
      (mkKeymap "n" "<leader>-" "<cmd>split<cr>" "horizontal split")

      # quickfix
      (mkKeymap "n" "<leader>cn" "<cmd>cnext<cr>" "quickfix next")
      (mkKeymap "n" "<leader>cp" "<cmd>cprev<cr>" "quickfix prev")
      (mkKeymap "n" "<leader>cq" "<cmd>cclose<cr>" "quit quickfix")

      (mkLuaKeymap "n" "<leader>id"
        # lua
        ''
          function()
            local date = "# " .. os.date("%d-%m-%y")
            local row, col = unpack(vim.api.nvim_win_get_cursor(0))
            local line = vim.api.nvim_get_current_line()

            -- Insert date at cursor position
            local new_line = line:sub(1, col) .. date .. line:sub(col + 1)
            vim.api.nvim_set_current_line(new_line)

            -- Move cursor to next line
            vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
          end
        ''
        "Insert Date at cursor position"
      )

      (mkKeymap "n" "n" "nzzzv" "Move to center")
      (mkKeymap "n" "N" "Nzzzv" "Moving to center")
      (mkLuaKeymap "n" "<leader>ft"
        # lua
        ''
          function()
            vim.ui.input({ prompt = "Enter FileType: " }, function(input)
              local ft = input
              if not input or input == "" then
                ft = vim.bo.filetype
              end
              vim.o.filetype = ft
            end)
          end
        ''
        "Set Filetype"
      )

      (mkLuaKeymap "n" "<leader>o"
        # lua
        ''
          function()
            local word = vim.fn.expand("<cfile>") -- Gets file-like word under cursor

            if word:match("^https?://") then
              -- Detect OS and choose browser opener
              local open_cmd
              if vim.fn.has("macunix") == 1 then
                open_cmd = "open"
              elseif vim.fn.has("unix") == 1 then
                open_cmd = "xdg-open"
              elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
                open_cmd = "start"
              else
                print("Unsupported OS")
                return
              end

              vim.fn.jobstart({ open_cmd, word }, { detach = true })

            elseif vim.fn.filereadable(word) == 1 or vim.fn.isdirectory(word) == 1 then
              -- It's a file or directory; open in current window
              vim.cmd("edit " .. vim.fn.fnameescape(word))
            else
              print("Not a valid file or URL: " .. word)
            end
          end
        ''
        "Open"
      )
    ];
  };
}
