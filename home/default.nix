{ ... }:

{
  imports = [
    ./shell.nix
    ./terminal.nix
    ./editor.nix
    ./desktop.nix
    ./git.nix
    ./development.nix
    ./cli-tools.nix
    ./services.nix
    ./scripts.nix
  ];

  home = {
    username = "michal";
    homeDirectory = "/home/michal";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
