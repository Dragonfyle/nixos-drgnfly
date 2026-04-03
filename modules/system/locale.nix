{ ... }:

{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
      LC_MEASUREMENT = "pl_PL.UTF-8";
      LC_PAPER = "pl_PL.UTF-8";
    };
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "pl_PL.UTF-8/UTF-8"
    ];
  };

  time.timeZone = "Europe/Warsaw";

  console.keyMap = "us";

  services.xserver.xkb = {
    layout = "us";
    options = "ctrl:swapcaps";
  };
}
