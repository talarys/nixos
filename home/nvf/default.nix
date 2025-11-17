# NVF is a Neovim configuration that provides a minimal setup with essential plugins and configurations.
{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./options.nix
    ./diagnostics.nix
    ./languages.nix
    ./lsp.nix
    ./snacks.nix
    ./keymaps.snacks.nix
    ./keymaps.lsp.nix
    ./keymaps.nix
    ./utils.nix
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      startPlugins = [
        pkgs.vimPlugins.vim-kitty-navigator
      ];
    };
  };
}
