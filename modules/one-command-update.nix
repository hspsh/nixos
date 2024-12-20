{ path, name }:{
  configureHome = {
     programs.zsh = {
      shellAliases = {
        update = "sudo nixos-rebuild switch --impure";
        };
    };
};
}
