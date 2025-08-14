{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.desktop.stylix;
in {
  options.modules.desktop.stylix = {
    enable = mkEnableOption "Stylix configuration";
    base16Scheme = mkOption {
      type = types.str;
      default = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      description = "Path to the base16 scheme file for Stylix.";
    };
  };

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      inherit (cfg) base16Scheme;
    };
  };
}
