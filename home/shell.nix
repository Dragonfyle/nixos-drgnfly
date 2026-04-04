{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };

  xdg.configFile = {
    "fish/config.fish".source = ../dotfiles/fish/config.fish;
    "fish/conf.d".source = ../dotfiles/fish/conf.d;
    "fish/functions".source = ../dotfiles/fish/functions;
    "fish/completions".source = ../dotfiles/fish/completions;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.keychain = {
    enable = true;
    keys = [
      "gh_yubikey_usb_a_resident"
      "gh_yubikey_usb_c_resident"
    ];
  };

  programs.autojump.enable = true;

  home.sessionPath = [
    "$HOME/scripts"
    "$HOME/.local/bin"
  ];
}
