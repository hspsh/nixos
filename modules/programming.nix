{ pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (with pkgs.google-cloud-sdk.components; [
    gke-gcloud-auth-plugin
  ]);
in
{

  environment.systemPackages = with pkgs; [
    ## Node
    nodejs
    nodePackages.npm
    nodePackages.bash-language-server
    yarn

    ## Google devel Kit
    gdk
    
    yaml-language-server

    gitlab-runner
    sonar-scanner-cli

    glab
  ];

  ## Docker
  virtualisation.docker.enable = true;
  users.users.psuwala.extraGroups = [ "docker" ];
  boot.kernel.sysctl."vm.max_map_count" = 1000000;

}
