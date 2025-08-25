{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.virtualisation.virt;
in {
  options.modules.virtualisation.virt = {
    enable = mkEnableOption "Virtualisation configuration";
  };
  config = mkIf cfg.enable {
    users.users.talarys.extraGroups = ["libvirtd" "kvm"];
    boot.kernelModules = ["kvm-amd"];

    environment.systemPackages = with pkgs; [
      qemu_kvm
      quickemu
      quickgui
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [pkgs.OVMFFull.fd];
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
  };
}
