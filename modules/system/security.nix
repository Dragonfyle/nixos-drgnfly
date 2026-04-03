{ pkgs, ... }:

{
  services.pcscd.enable = true;

  security.pam.u2f = {
    enable = true;
    control = "sufficient";
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager
  ];
}
