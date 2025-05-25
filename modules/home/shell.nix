{pkgs, ...}: {
  programs = {
    yazi = {
      #TODO yazi.flavours
      enable = true;
      enableFishIntegration = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
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
    };

    broot = {
      enable = true;
      enableFishIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
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

    alejandra
    deadnix
    statix
    neovim
  ];
}
