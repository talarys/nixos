{
  pkgs,
  username,
  nix-index-database,
  ...
}: {
  imports = [
    nix-index-database.hmModules.nix-index
  ];

  home.stateVersion = "24.11";

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    sessionVariables.EDITOR = "nvim";
    sessionVariables.SHELL = "/etc/profiles/per-user/${username}/bin/fish";
  };

  home.packages = with pkgs; [
    bat # Command-line cat, useful for reading files
    coreutils # Essential command-line utilities
    curl # Tool for transferring data with URLs
    du-dust # A fast, simple alternative to `du`
    fd # A fast, flexible alternative to `find`
    findutils # Collection of command-line utilities for finding files
    fx # A command-line tool for searching files
    git # Version control system

    btop # Interactive process viewer
    jq # Command-line JSON processor
    killall # Kill processes by name
    mosh # A resilient, SSH-like protocol
    procs # Collection of useful shell procedures
    ripgrep # A fast grep that works recursively
    sd # A simple, fast, and user-friendly disk usage analyzer
    tmux # Terminal multiplexer
    tree # Displays directory structure
    unzip # Extracts files from zip archives
    vim # Text editor
    wget # Download files from the internet
    zip # Creates zip archives

    gh # GitHub CLI
    just # Build system and package manager

    rustup # Rust toolchain installer
    cargo-cache # Cache Rust package dependencies
    cargo-expand # Expand Rust package dependencies

    zig # Zig programming language
    mkcert # Generate self-signed certificates
    httpie # HTTP client

    nil # Nix package manager
    alejandra # Nix package manager
    deadnix # Nix package manager
    statix # Nix package manager

    shellcheck # Static analysis tool for shell scripts
    shfmt # Code formatter for shell scripts
    neovim # Text editor
    zig # Systems programming language
    stow # Symlink manager
  ];

  programs = {
    home-manager.enable = true;
    nix-index.enable = true;
    nix-index.enableFishIntegration = true;
    nix-index-database.comma.enable = true;

    starship.enable = true;
    starship.settings = {
      aws.disabled = true;
      gcloud.disabled = true;
      kubernetes.disabled = false;
      git_branch.style = "242";
      directory.style = "blue";
      directory.truncate_to_repo = false;
      directory.truncation_length = 8;
      python.disabled = true;
      ruby.disabled = true;
      hostname.ssh_only = false;
      hostname.style = "bold green";
    };

    fzf.enable = true;
    fzf.enableFishIntegration = true;
    lsd.enable = true;
    lsd.enableAliases = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;
    zoxide.options = ["--cmd cd"];
    broot.enable = true;
    broot.enableFishIntegration = true;
    direnv.enable = true;
    direnv.nix-direnv.enable = true;

    git = {
      enable = true;
      delta.enable = true;
      delta.options = {
        line-numbers = true;
        side-by-side = true;
        navigate = true;
      };
      userEmail = "d.simon.ssx0@gmail.com";
      userName = "talarys";
      extraConfig = {
        push = {
          default = "current";
          autoSetupRemote = true;
        };
        merge = {
          conflictstyle = "diff3";
        };
        diff = {
          colorMoved = "default";
        };
      };
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

        ${pkgs.lib.strings.fileContents (pkgs.fetchFromGitHub {
            owner = "rebelot";
            repo = "kanagawa.nvim";
            rev = "de7fb5f5de25ab45ec6039e33c80aeecc891dd92";
            sha256 = "sha256-f/CUR0vhMJ1sZgztmVTPvmsAgp0kjFov843Mabdzvqo=";
          }
          + "/extras/kanagawa.fish")}

        set -U fish_greeting
        fish_add_path --append /mnt/c/Users/talarys/scoop/apps/win32yank/current
      '';
      functions = {
        refresh = "source $HOME/.config/fish/config.fish";
        take = ''mkdir -p -- "$1" && cd -- "$1"'';
        ttake = "cd $(mktemp -d)";
        show_path = "echo $PATH | tr ' ' '\n'";
        posix-source = ''
          for i in (cat $argv)
            set arr (echo $i |tr = \n)
            set -gx $arr[1] $arr[2]
          end
        '';
      };
      shellAbbrs =
        {
          gc = "nix-collect-garbage --delete-old";
          rebuild = "sudo nixos-rebuild switch --flake /home/talarys/nixos";
        }
        # navigation shortcuts
        // {
          ".." = "cd ..";
          "..." = "cd ../../";
          "...." = "cd ../../../";
          "....." = "cd ../../../../";
        }
        # git shortcuts
        // {
          gapa = "git add --patch";
          grpa = "git reset --patch";
          gst = "git status";
          gdh = "git diff HEAD";
          gp = "git push";
          gph = "git push -u origin HEAD";
          gco = "git checkout";
          gcob = "git checkout -b";
          gcm = "git checkout master";
          gcd = "git checkout develop";
          gsp = "git stash push -m";
          gsa = "git stash apply stash^{/";
          gsl = "git stash list";
        };
      shellAliases = {
        pbcopy = "/mnt/c/Windows/System32/clip.exe";
        pbpaste = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -command 'Get-Clipboard'";
        explorer = "/mnt/c/Windows/explorer.exe";

        code = "/mnt/c/Users/talarys/AppData/Local/Programs/'Microsoft VS Code'/bin/code";
      };
      plugins = [
        {
          inherit (pkgs.fishPlugins.autopair) src;
          name = "autopair";
        }
        {
          inherit (pkgs.fishPlugins.done) src;
          name = "done";
        }
        {
          inherit (pkgs.fishPlugins.sponge) src;
          name = "sponge";
        }
      ];
    };
  };
}
