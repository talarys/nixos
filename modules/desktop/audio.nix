{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.desktop.audio;
in
{
  options.modules.desktop.audio = {
    enable = mkEnableOption "audio support";
  };

  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true; # PulseAudio compatibility
      jack.enable = true; # JACK compatibility
    };

    environment.systemPackages = with pkgs; [
      pavucontrol # PulseAudio volume control
      playerctl # Media player control
      pulseaudio # For pactl command
    ];
  };
}
