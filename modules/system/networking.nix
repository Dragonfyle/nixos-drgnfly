{ ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

    wireless.iwd.enable = true;

    firewall = {
      enable = true;
      allowPing = true;
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "allow-downgrade";
      FallbackDNS = "1.1.1.1 8.8.8.8";
    };
  };
}
