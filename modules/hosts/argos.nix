{ inputs, ... }:
{
  flake.homeConfigurations.argos = inputs.home-manager.lib.homeManagerConfiguration {
    system = "x86_64-linux";
    modules = with inputs.self.modules.homeManager; [ ];
  };

  flake.nixosConfigurations.argos = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos; [
      argos
    ];
  };

  flake.modules.nixos.argos = {
    networking.hostName = "argos";
    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.05";

    boot.initrd.kernelModules = [ ];
    boot.initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];

    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];
  };
}
