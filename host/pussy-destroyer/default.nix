{ ... }:
{
  imports =
    [
      # Include the results of the hardware scan.   
      ./disko.nix
      ./btrfs-snapshot.nix
      ./timers.nix
      ./jira-cli.nix
      ./sops.nix
      ./users.nix
      ./kinguin-vpn.nix
      ./hardware-configuration.nix

      ../../modules/base.nix
      ../../modules/packages.nix
      ../../modules/appimage.nix
      ../../modules/design.nix
      ../../modules/i18n.nix
      ../../modules/graphics.nix
      ../../modules/bluetooth.nix
      ../../modules/openssh.nix
      ../../modules/games.nix
      ../../modules/google-sync.nix
      ../../modules/i3.nix
      ../../modules/office.nix
      ../../modules/system.nix
      ../../modules/printing.nix
      ../../modules/lib64-polyfill.nix
      ../../modules/notes.nix
      ../../modules/programming.nix
      ../../modules/hledger.nix

      # <home-manager>
      ../../home-manager/main.nix

      # ./utils/disable-lid-switch.nix
      ../../utils/enable-lid-switch.nix
      ../../utils/adsblock.nix
      ../../utils/random-option.nix
      ../../utils/home-manager-commons.nix
    ];
}
