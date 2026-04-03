{ pkgs, config, ... }:

{
  programs.alacritty.enable = true;

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
    ];
  };

  xdg.configFile."alacritty/alacritty.toml".source = ../dotfiles/alacritty/alacritty.toml;

  home.file.".tmux.conf".source = ../dotfiles/tmux.conf;
}
