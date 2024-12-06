{ pkgs, ... }: {
  ## FIREWALL

  networking.hostName = "pussy-destroyer"; # Define your hostname.
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;

  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];
}
