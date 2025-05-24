{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "talarys";
    userEmail = "d.simon.ssx0@gmail.com";

    # Common Aliases
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      df = "diff";
      dc = "diff --cached";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      lol = "log --graph --decorate --oneline --all";
      oops = "commit --amend --no-edit";
      cleanup = "!git branch --merged | grep -v '\\*\\|main\\|master\\|develop' | xargs -n 1 git branch -d";
      nvimdiff = "nvim -d";
    };

    # Core Configuration
    extraConfig = {
      core = {
        editor = "nvim"; # or your preferred editor
        pager = "less -FRX";
        autocrlf = "input"; # for Linux/macOS, use "true" for Windows
        # fsmonitor = true; # Uncomment for faster file system monitoring (requires watchman)
      };

      # Color Settings
      color = {
        ui = true;
        diff = "auto";
        status = "auto";
        branch = "auto";
        interactive = "auto";
      };

      # Diff Configuration
      diff = {
        renames = "copies";
        wsErrorHighlight = "all";
        tool = "nvimdiff"; # Change to your preferred diff tool
      };

      # Merge Configuration
      merge = {
        conflictstyle = "diff3";
        tool = "nvimdiff"; # Change to your preferred merge tool
      };

      # Pull Configuration
      pull = {
        rebase = "merges";
        ff = "only";
      };

      # Push Configuration
      push = {
        default = "current";
        autoSetupRemote = true;
      };

      # Rebase Configuration
      rebase = {
        autoStash = true;
        autoSquash = true;
      };

      # Commit Configuration
      commit = {
        verbose = true;
        gpgsign = false; # Set to true if using GPG signing
      };

      # Interactive Settings
      interactive = {
        diffFilter = "delta --color-only"; # Requires delta package
      };

      # Helpful Features
      init.defaultBranch = "main";
      fetch.prune = true;
      rerere.enabled = true;
      advice = {
        addEmbeddedRepo = false;
        detachedHead = false;
      };

      # Credential Helper (choose appropriate for your OS)
      credential.helper = "store"; # For Linux
      # credential.helper = "osxkeychain"; # For macOS
      # credential.helper = "manager-core"; # For Windows

      # Safe directories (useful for GitHub Codespaces, etc)
      safe.directory = [
        "/etc/nixos"
        "${config.home.homeDirectory}/.config/nixpkgs"
      ];
    };
  };

  # Optional: Install git-related tools
  home.packages = with pkgs; [
    git-lfs # Large file support
    gh # GitHub CLI
    delta # Syntax-highlighting pager
    tig # Text-mode interface for Git
    lazygit # Terminal UI for Git
    gitui # Another terminal UI for Git
    # watchman # Needed for core.fsmonitor
  ];
}
