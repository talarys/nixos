let
  device = "/dev/sda";
  mountOptions = [
    "noatime"
    "compress=zstd"
    "ssd"
    "discard=async"
    "space_cache=v2"
  ];
in
{
  flake.modules.disko.btrfs-nvme = {
    services.btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
    };
    disko.devices = {
      disk = {
        nvme = {
          type = "disk";
          inherit device;
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                priority = 1;
                name = "ESP";
                start = "1M";
                end = "500M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@" = {
                      mountpoint = "/";
                      inherit mountOptions;
                    };
                    "@home" = {
                      mountpoint = "/home";
                      inherit mountOptions;
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      inherit mountOptions;
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
