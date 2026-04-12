{ ... }:

{
  imports = [
    ./hardware-configuration.nix # generated at install time by nixos-generate-config

    ../../modules/system/boot.nix
    ../../modules/system/locale.nix
    ../../modules/system/networking.nix
    ../../modules/system/audio.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/security.nix
    ../../modules/system/virtualization.nix

    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/fonts.nix
    ../../modules/desktop/flatpak.nix
  ];

  networking.hostName = "drgnfly";

  services.xserver.videoDrivers = [ "vmware" ];
  hardware.graphics.enable = true;
  virtualisation.vmware.guest.enable = true;

  users.users.michal = {
    isNormalUser = true;
    initialPassword = "changeme";
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
      "storage"
      "docker"
      "vboxusers"
      "wireshark"
      "networkmanager"
    ];
    shell = "/run/current-system/sw/bin/fish";
  };

  programs.fish.enable = true;

  programs.git = {
  	enable = true;
	config = {
		safe.directory = ["/etc/nixos/flake-drgnfly"];
	};
};

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "michal" ];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
