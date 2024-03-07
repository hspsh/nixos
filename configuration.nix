# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
let
  k3sConfig = import ./utils/k8s.nix {inherit pkgs;};
in
{
  imports =
    [ # Include the results of the hardware scan.   
      ./hardware-configuration.nix
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
      ./disko.nix

      ./modules/base.nix
      # ./modules/wireguard.nix
      ./modules/packages.nix
      ./modules/appimage.nix
      ./modules/design.nix
      ./modules/i18n.nix
      ./modules/graphics.nix
      ./modules/networking.nix
      ./modules/sound.nix
      ./modules/bluetooth.nix
      ./modules/openssh.nix
      ./modules/games.nix
      ./modules/btrfs-snapshot.nix
      ./modules/timers.nix
      ./modules/google-sync.nix
      ./modules/jira-cli.nix
      ./modules/i3.nix
      ./modules/office.nix
      ./modules/node.nix
      ./modules/openvpn.nix
      ./modules/docker.nix
      ./modules/music.nix
      ./modules/printing.nix
      ./modules/lib64-polyfill.nix
      ./modules/notes.nix
      ./modules/gcloud.nix
      
      <home-manager/nixos>
      ./home-manager/main.nix

      # ./utils/disable-lid-switch.nix
      ./utils/enable-lid-switch.nix
      ./utils/adsblock.nix
      ./utils/random-option.nix

      ./utils/home-manager-commons.nix
    ];

}
