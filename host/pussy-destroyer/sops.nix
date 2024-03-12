{ ... }:{
  sops.defaultSopsFile = ./secrets.yaml;
  sops.age.sshKeyPaths = [ /home/psuwala/.ssh/id_ed25519 ];
  sops.age.generateKey = false;
  sops.secrets."jira/token" = { };
  sops.secrets."openvpn/configuration" = { };
  sops.secrets."openvpn/password" = { };
}
