{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      # deps
      home.packages = with pkgs; [
        fd
        sysz # fzf for systemctl
      ];

      programs = {
        fzf = {
          enable = true;
          enableFishIntegration = true;
          fileWidgetOptions = [
            "--preview 'bat -n --color=always {}'"
            "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
          ];
          changeDirWidgetOptions = [ "--preview 'tree -C {}'" ];
          historyWidgetOptions = [
            "--preview 'echo {}' --preview-window up:3:hidden:wrap"
            "--bind 'ctrl-/:toggle-preview'"
            "--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
            "--color header:italic"
            "--header 'Press CTRL-Y to copy command into clipboard'"
          ];
        };
      };
    };
}
