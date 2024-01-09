{...}: {
  services.openvpn.servers = {
    kinguin-vpn  = { config = '' config /etc/nixos/.openvpn.conf ''; };
  };
}
