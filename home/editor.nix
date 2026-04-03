{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context
    ];
  };

  xdg.configFile = {
    "nvim/init.lua".source = ../dotfiles/nvim/init.lua;
    "nvim/after".source = ../dotfiles/nvim/after;
    "nvim/snippets".source = ../dotfiles/nvim/snippets;
  };
}
