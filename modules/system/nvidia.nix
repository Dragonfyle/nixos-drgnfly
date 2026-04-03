{ config, ... }:

{
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.extraModprobeConfig = ''
    options nvidia_drm modeset=1
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
  '';
}
