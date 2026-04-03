{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
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
