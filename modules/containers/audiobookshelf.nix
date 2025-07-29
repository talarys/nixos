{
  system.activationScripts = {
    script.text = ''
      install -d -m 755 /var/lib/containers/audiobookshelf/config -o root -g root
      install -d -m 755 /var/lib/containers/audiobookshelf/metadata -o root -g root
    '';
  };

  virtualisation.oci-containers.containers = {
    audiobookshelf = {
      image = "advplyr/audiobookshelf:latest";

      environment = {
        TZ = "Europe/Madrid";
      };

      volumes = [
        "/var/lib/containers/audiobookshelf/config:/config"
        "/var/lib/containers/audiobookshelf/metadata:/metadata"
        "/mnt:/mnt"
      ];

      ports = [
        "13378:80"
      ];

      autoStart = true;
    };
  };
}
