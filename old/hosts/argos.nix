{ inputs, ... }:
let
  system = "x86_64-linux";
  hostname = "argos";
in
{
  flake.homeConfigurations.${hostname} = inputs.home-manager.lib.homeManagerConfiguration {
    inherit system;
    modules = with inputs.self.modules.homeManager; [ ];
  };

  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = with inputs.self.modules.nixos; [ hostname ];
  };

  flake.modules.nixos.${hostname} = {
    networking.hostName = hostname;
    nixpkgs.hostPlatform = system;
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
