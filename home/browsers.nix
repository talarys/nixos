{ inputs, ... }:
{
  imports = [
    # inputs.zen-browser.homeModules.beta
    inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];
  programs.firefox.enable = true;
  programs.zen-browser.enable = true;
}
