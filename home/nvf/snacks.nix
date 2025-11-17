{
  programs.nvf.settings.vim.utility.snacks-nvim = {
    enable = true;
    setupOpts = {
      # https://github.com/folke/snacks.nvim?tab=readme-ov-file#-features
      animate.enable = true; # Efficient animations including over 45 easing functions (library)
      bigfile.enable = true; # Deal with big files
      # bufdelete.enable = true; # Delete buffers without disrupting window layout
      # dashboard.enable = true; # Beautiful declarative dashboards
      # debug.enable = true; # Pretty inspect & backtraces for debugging
      # dim.enable = true; # Focus on the active scope by dimming the rest
      explorer.enable = true; # A file explorer (picker in disguise)
      gh.enable = true; # GitHub CLI integration
      git.enable = true; # Git utilities
      gitbrowse.enable = true; # Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)
      image.enable = true; # Image viewer using Kitty Graphics Protocol, supported by kitty, wezterm and ghostty
      indent.enable = true; # Indent guides and scopes
      input.enable = true; # Better vim.ui.input
      # keymap.enable = true; # Better vim.keymap with support for filetypes and LSP clients
      # layout.enable = true; # Window layouts
      lazygit.enable = true; # Open LazyGit in a float, auto-configure colorscheme and integration with Neovim
      notifier.enable = true; # Pretty vim.notify
      # notify.enable = true; # Utility functions to work with Neovim's vim.notify
      picker.enable = true; # Picker for selecting items
      profiler.enable = true; # Neovim lua profiler
      quickfile.enable = true; # When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
      rename.enable = true; # LSP-integrated file renaming with support for plugins like neo-tree.nvim and mini.files.
      scope.enable = true; # Scope detection, text objects and jumping based on treesitter or indent
      scratch.enable = true; # Scratch buffers with a persistent file
      scroll.enable = true; # Smooth scrolling ️
      statuscolumn.enable = true; # Pretty status column
      terminal.enable = true; # Create and toggle floating/split terminals
      toggle.enable = true; # Toggle keymaps integrated with which-key icons / colors
      util.enable = true; # Utility functions for Snacks (library)
      # win.enable = true; # Create and manage floating windows or splits
      words.enable = true; # Auto-show LSP references and quickly navigate between them
      # zen.enable = true; # Zen mode • distraction-free coding
    };
  };
}
