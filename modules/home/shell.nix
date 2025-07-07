{pkgs, ...}: {
  home.file.yazi = {
    source = ../../config/yazi;
    target = ".config/yazi";
  };

  programs = {
    yazi = {
      #TODO yazi.flavours
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      settings = {
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
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    broot = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    carapace = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    atuin = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    pay-respects = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };

  home.packages = with pkgs; [
    bat
    uutils-coreutils-noprefix
    curl
    wget
    dua
    gdu
    dust
    fd
    btop
    procs
    ripgrep
    unzip
    zip
    p7zip
    gh
    git
    nil
    hyperfine
    just
    epy
    scrcpy
    android-tools
    devenv
    devbox
    watchexec
    entr

    bun
    nodejs
    pnpm
    go
    cargo
    rustc

    alejandra
    deadnix
    statix
    neovim
    nixfmt-rfc-style

    stack
    cabal-install
    zlib
    hpack
    haskell-language-server
    ghc
    ghciwatch
  ];

  home.shellAliases = {
  };

  home.sessionPath = [
    "/mnt/c/Program Files/Neovim/bin/"
  ];
}
