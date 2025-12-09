{ pkgs, ... }:
{
  services.ssh-agent = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs = {
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
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

    lazygit = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };

    bat = {
      enable = true;
      config = {
        theme = "Catppuccin Mocha";
      };
      extraPackages = with pkgs.bat-extras; [
        batgrep
        batman
        batpipe
        batwatch
        batdiff
        prettybat
      ];
    };
  };
}
