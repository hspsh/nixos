{ config, pkgs, ... }:
{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  # Enable WireGuard
  networking.wireguard.interfaces = {
    wg0 = {
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      ips = [ "10.68.13.37" ];
      listenPort = 51820;

      privateKeyFile = "/home/psuwala/.ssh/wg-key";

      peers = [
        {
          publicKey = "rKJFIFCn0+P27xIKOJehUtXwVZVdf1GWDwzuBatK41Q=";
          allowedIPs = [ "10.68.0.0/16" ];
          endpoint = "artur.at.hsp.sh:51820"; 
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
