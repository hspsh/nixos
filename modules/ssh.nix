{ ... }: {
  imports = [ ../utils/home-manager-commons.nix ];

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  programs.ssh.startAgent = true;
  home-manager-commons.programs.ssh.enable = true;
  home-manager-commons.programs.ssh.matchBlocks = {
    artur = {
      hostname = "artur.at.hsp.sh";
      forwardAgent = true;
    };
    lucy = {
      hostname = "192.168.88.94";
      proxyJump = "artur";
    };
  };
}
