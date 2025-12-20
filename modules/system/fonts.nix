{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.system.fonts;
in
{
  options.modules.system.fonts = {
    enable = mkEnableOption "font configuration";
  };

  config = mkIf cfg.enable {
    fonts = {
      # Enable font configuration
      fontconfig = {
        enable = true;

        # Better font rendering
        subpixel.rgba = "rgb";
        hinting.enable = true;
        hinting.style = "slight";
        antialias = true;

        # Default fonts
        defaultFonts = {
          serif = [
            "Noto Serif"
            "Liberation Serif"
          ];
          sansSerif = [
            "Noto Sans"
            "Liberation Sans"
          ];
          monospace = [
            "JetBrains Mono"
            "Liberation Mono"
          ];
          emoji = [ "Noto Color Emoji" ];
        };
      };

      # Font packages
      packages = with pkgs; [
        # Nerd Fonts
        nerd-fonts.fira-code
        nerd-fonts.atkynson-mono
        nerd-fonts.caskaydia-cove
        nerd-fonts.caskaydia-mono
        nerd-fonts.hack
        nerd-fonts.iosevka
        nerd-fonts.jetbrains-mono

        # System fonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf

        # Programming fonts
        jetbrains-mono
        fira-code
        source-code-pro

        # Popular fonts
        roboto
        open-sans
        ubuntu_font_family

        # Icon fonts
        font-awesome
      ];

      # Enable 32-bit font support
      enableGhostscriptFonts = true;
    };
  };
}
