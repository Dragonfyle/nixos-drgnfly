{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Michal Rygorowicz";
      user.email = "rygorowicz.michal@hotmail.com";
      core.autocrlf = "input";
    };
  };

  programs.gh.enable = true;

  xdg.configFile."git/ignore".source = ../dotfiles/git/ignore;
}
