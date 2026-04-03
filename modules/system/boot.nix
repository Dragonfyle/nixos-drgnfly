{ pkgs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };

    kernelPackages = pkgs.linuxPackages;

  };
}
