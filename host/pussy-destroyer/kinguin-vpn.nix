{ ... }: {
  services.openvpn.servers = {
    kinguin-vpn = { config = '' config /run/secrets/openvpn/configuration ''; };
  };
}
