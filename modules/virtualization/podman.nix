{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.virtualization.podman;
in {
  options.modules.virtualization.podman = {
    enable = mkEnableOption "Podman configuration";
  };
  config = mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      autoPrune.enable = true;
    };
    virtualisation.oci-containers.backend = "podman";
  };
}
