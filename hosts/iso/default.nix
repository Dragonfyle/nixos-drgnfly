{ ... }:
{
  imports = [
    # Desktop stuff - portable
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/fonts.nix
    ../../modules/desktop/flatpak.nix

    # System modules - only portable ones
    ../../modules/system/audio.nix
    ../../modules/system/bluetooth.nix
    # DO NOT import boot.nix - conflicts with ISO bootloader
    # DO NOT import any hardware-configuration
  ];

  # Wide hardware support for any machine
  hardware.enableRedistributableFirmware = true;
  hardware.video.hidpi.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  # Generic bootloader (ISO module handles actual booting)
  boot.loader.grub.enable = false;

  networking.networkmanager.enable = true;

  # Your user
  users.users.michal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    # set a password so you can actually log in on the live system
    initialPassword = "live";
  };
}
