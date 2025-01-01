{ path, host }:{
  # imports = [
  #   ../utils/home-manager-commons.nix
  # ];
  home-manager-commons = {
     programs.zsh = {
      shellAliases = {
        update = "sudo nixos-rebuild switch --flake ${path}#${host}";
        };
    };
};
}
