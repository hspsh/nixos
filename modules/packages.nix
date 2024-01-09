{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.7"
  ];

  environment.systemPackages = with pkgs; [
    discord

    git
    google-chrome
    xclip
    wireguard-tools

    nodePackages.node-red

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

    (python3.withPackages (pyton: with pyton;[
      mt-940
      pandas
    ]))

    python2

    openjdk11
    openjdk8
    gradle

    yq
    jq

    nomacs
  ];
}
