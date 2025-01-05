{ ... }: {
  imports = [ ../utils/home-manager-commons.nix ];
  
  home-manager-commons.programs.ssh.matchBlocks = {
    artur = {
      hostname = "artur.at.hsp.sh";
      forwardAgent = true;
    };
  };
}
