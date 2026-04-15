{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.uwsm.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  programs.xwayland.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
