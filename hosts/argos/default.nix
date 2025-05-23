{
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    outputs.nixosModules.system
    outputs.nixosModules.kde
    outputs.nixosModules.nvidia
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = outputs.hostname;
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    vscode
    mkpasswd
    firefox

    nil
    alejandra
    deadnix
    statix
  ];
}
