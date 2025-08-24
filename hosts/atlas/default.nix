{...}: {
  imports = [
    ../common.nix
    ./disko.nix
  ];

  system.roles = [
    "dev"
  ];

  modules = {
    core = {
      networking.enable = false;
    };
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAUAzIuK7sfr9TTOyOmWM3nm7kWZLJt0H08VLKmwlG+e d.simon.ssx0@gmail.com"
  ];

  users.users.talarys.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAUAzIuK7sfr9TTOyOmWM3nm7kWZLJt0H08VLKmwlG+e d.simon.ssx0@gmail.com"
  ];

  networking.hostName = "atlas";
}
