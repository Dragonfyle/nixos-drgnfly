{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "CHANGEME";
      user.email = "CHANGEME";
      core.autocrlf = "input";
    };
  };

  programs.gh.enable = true;

  xdg.configFile."git/ignore".source = ../dotfiles/git/ignore;
}
