{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
