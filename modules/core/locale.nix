{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.core.locale;
in {
  options.modules.core.locale.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable the core locale configuration for NixOS.";
  };
  config = lib.mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = lib.mkDefault "Europe/Madrid";
    console.useXkbConfig = lib.mkDefault true;
  };
}
