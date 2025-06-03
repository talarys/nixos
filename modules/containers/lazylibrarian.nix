{
  image = "lscr.io/linuxserver/lazylibrarian:latest";

  environment = {
    TZ = "Europe/Madrid";
  };

  ports = [
    "5299:5299"
  ];

  autoStart = true;
}
