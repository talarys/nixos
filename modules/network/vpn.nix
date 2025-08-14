{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.core.vpn;
in {
  options.modules.nixos.core.vpn = {
    enable = mkEnableOption "VPN support for NixOS";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      protonvpn-gui
      protonvpn-cli
    ];

    services.resolved.enable = false;
    networking.resolvconf.enable = true;
    networking.resolvconf.dnsExtensionMechanism = false;

    networking.firewall = {
      enable = true;
      checkReversePath = "loose"; # Critical for VPNs
      allowedUDPPorts = [443 1194]; # ProtonVPN ports
      allowedTCPPorts = [443 1194];
    };
  };
}
