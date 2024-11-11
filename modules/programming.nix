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

    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.phpstorm

    # programmer utils
    git
    ripgrep
    nixd
    nil
    fzf
    nixpkgs-fmt
    nodePackages.node-red
    coreutils
    binutils
    gcc
    hexedit
    jq
    mongosh

    ## python
    (python310.withPackages (pyton: with pyton;[
      mt-940
      pandas
      pip

      argcomplete
      markupsafe
      tomlkit
      jinja2
      pyyaml
      xmltodict

      qrcode
      requests

      lxml
      pillow
      tkinter
      pyusb
      inkscape
    ]))

    ## java
    openjdk21
    openjdk17
    openjdk11
    openjdk8
    gradle

    ## K8S
    kubectx
    docker-compose
    kubernetes-helm
    kubectl
    kubectx
  ];

  ## Docker
  virtualisation.docker.enable = true;
  users.users.psuwala.extraGroups = [ "docker" ];
  boot.kernel.sysctl."vm.max_map_count" = 1000000;

}
