{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

        set -U fish_greeting
      '';
      functions = {
        refresh = "source $HOME/.config/fish/config.fish";
        take = ''mkdir -p -- "$1" && cd -- "$1"'';
        ttake = "cd $(mktemp -d)";
        show_path = "echo $PATH | tr ' ' '\n'";
        posix-source = ''
          for i in (cat $argv)
            set arr (echo $i |tr = \n)
            set -gx $arr[1] $arr[2]
          end
        '';
      };
      shellAbbrs = {
        rebuild = "sudo nixos-rebuild switch --flake /home/talarys/nixos";
      };
      shellAliases = {
        ls = "eza --icons --group-directories-first";
        ll = "eza -l --icons --group-directories-first";
        la = "eza -la --icons --group-directories-first";
        l = "eza -l --icons --group-directories-first";
        tree = "eza -T --icons --group-directories-first";
      };

      plugins = [
        {
          inherit (pkgs.fishPlugins.autopair) src;
          name = "autopair";
        }
        {
          inherit (pkgs.fishPlugins.done) src;
          name = "done";
        }
        {
          inherit (pkgs.fishPlugins.sponge) src;
          name = "sponge";
        }
      ];
    };
  };
}
