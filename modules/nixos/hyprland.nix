{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hyprland
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    rofi-wayland
    waybar
  ];
  services = {
    displayManager.sddm.enable = true;
    hypridle.enable = true;
  };
  programs = {
    hyprlock.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };
}
