{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.7"
    "electron-25.9.0"
  ];

  environment.systemPackages = with pkgs; [
    discord

    git
    google-chrome
    xclip
    wireguard-tools

    nodePackages.node-red
    nodePackages.peerflix

    taskwarrior

    git
    ripgrep

    thefuck

    nixd
    nil
    rnix-lsp
    nixpkgs-fmt

    jetbrains.idea-ultimate
    jetbrains.webstorm

    slack
    telegram-desktop

    mpv

    snapper

    coreutils
    binutils
    gcc

    transmission-gtk

    google-drive-ocamlfuse
    gphotos-sync

    drawio
    dia

    hexedit

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
    ]))

    python2

    openjdk17
    openjdk11
    openjdk8
    gradle

    jq

    nomacs

    obs-studio

    r2modman

    arandr
    autorandr

    wget
    # bambu-studio

    mongosh
    kubectx
    docker-compose
    kubernetes-helm
    kubectl
    kubectx
    fzf

    graphviz
  ];
}
