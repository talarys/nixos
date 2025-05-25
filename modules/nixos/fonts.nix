{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.atkynson-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.hack
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
  ];
}
