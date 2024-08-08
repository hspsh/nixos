{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    direnv
  ];

  home-manager-commons.programs.zsh.initExtra = ''
    eval "$(direnv hook zsh)"
  '';
}
