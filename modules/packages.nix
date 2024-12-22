{ pkgs, ... }: {
  imports = [./packages-minimal.nix];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "nix-2.16.2"
    "nix-2.15.3"
  ];

  environment.systemPackages = with pkgs; [
    # user utils
    gnome.eog
    nodePackages.peerflix
    discord
    slack
    telegram-desktop
    google-chrome
    wireguard-tools
    mpv
    transmission-gtk
    drawio
    obs-studio
    taskwarrior
    evince

    # cli utils
    borgbackup
    ffmpeg
    sops
    htop

    # google
    google-drive-ocamlfuse
    gphotos-sync
  ];

  xdg.mime.defaultApplications = {
    "image/png" = "eog.desktop";
    "image/jpeg" = "eog.desktop";
    "application/pdf" = "evince.desktop";
  };
}
