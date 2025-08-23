{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.core.ssh;
in {
  options.modules.core.ssh = {
    server = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable SSH server.";
      };
    };
    agent = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable SSH agent.";
      };
    };
  };

  config = {
    services.openssh = lib.mkIf cfg.server.enable {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        X11Forwarding = true;
      };
      openFirewall = true;
    };

    programs.ssh = lib.mkIf cfg.agent.enable {
      startAgent = true;
      # knownHosts = {
      #   github = {
      #     hostNames = [ "github.com" ];
      #     publicKey = "ssh-rsa AAAAB3NzaC1yc2E...";
      #   };
      # };
    };
  };

  # Optional: Add your SSH public keys for passwordless login
  # users.users.talarys.openssh.authorizedKeys.keys = [
  #   "ssh-rsa AAAAB3NzaC1yc2E... yourkey@yourmachine"
  # ];
}
