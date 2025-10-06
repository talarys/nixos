{ lib, ... }:
{
  imports = [
    ../../disko/nvme.nix
    ../common.nix
    ./hardware-configuration.nix
  ];

  disko.devices.disk.nvme.device =
    lib.mkForce "/dev/disk/by-uuid/39f03cb5-d8dc-47cc-af93-5d217fc77e68";

  system.roles = [
    "desktop"
    "dev"
  ];

  networking.hostName = "argos";
}
