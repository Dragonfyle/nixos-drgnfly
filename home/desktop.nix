{ pkgs, ... }:

{
  xdg.configFile = {
    "hypr/hyprland.conf".source = ../dotfiles/hypr/hyprland.conf;
    "dunst/dunstrc".source = ../dotfiles/dunst/dunstrc;
    "fuzzel/fuzzel.ini".source = ../dotfiles/fuzzel/fuzzel.ini;
    "broot".source = ../dotfiles/broot;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "vivaldi-stable.desktop";
      "x-scheme-handler/http" = "vivaldi-stable.desktop";
      "x-scheme-handler/https" = "vivaldi-stable.desktop";
      "application/pdf" = "vivaldi-stable.desktop";
      "image/png" = "feh.desktop";
      "image/jpeg" = "feh.desktop";
    };
  };

  xdg.userDirs = {
    enable = true;
    setSessionVariables = true;
    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    publicShare = "$HOME/Public";
    templates = "$HOME/Templates";
    videos = "$HOME/Videos";
  };

  home.packages = with pkgs; [
    dunst
    fuzzel
    wl-clipboard
  ];
}
