{ pkgs, agenix, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "nix-2.16.2"
    "nix-2.15.3"
  ];

  environment.systemPackages = with pkgs; [
    gnome.eog
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

    smartmontools


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

    openjdk21
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

    dmidecode
    usbutils

    sops

    killall

    plantuml
    entr

    borgbackup

    ffmpeg
  ];

  xdg.mime.defaultApplications = {
    "image/png" = "eog.desktop";
  };
}
