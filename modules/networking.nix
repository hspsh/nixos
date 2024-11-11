{ pkgs, ... }: {
  ## FIREWALL

  networking.hostName = "pussy-destroyer"; # Define your hostname.
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;
}
