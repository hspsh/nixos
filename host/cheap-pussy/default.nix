{ ... }:
{
  imports =
    [
      # Include the results of the hardware scan.   
      ./timers.nix
      ./users.nix
      ./hardware-configuration.nix

      ../../modules/base.nix
      ../../modules/gc.nix
      ../../modules/direnv.nix
      ../../modules/packages.nix
      ../../modules/appimage.nix
      ../../modules/design.nix
      ../../modules/music.nix
      ../../modules/i18n.nix
      ../../modules/graphics.nix
      ../../modules/bluetooth.nix
      ../../modules/games.nix
      ../../modules/google-sync.nix
      ../../modules/i3.nix
      ../../modules/office.nix
      ../../modules/networking.nix
      ../../modules/printing.nix
      ../../modules/lib64-polyfill.nix
      ../../modules/programming.nix
      ../../modules/hledger.nix
      ../../modules/node-red.nix
      ../../modules/environment.nix
      ../../modules/ssh.nix
      ../../modules/borg.nix

      # <home-manager>
      ../../home-manager/main.nix

      # ./utils/disable-lid-switch.nix
      ../../utils/enable-lid-switch.nix
      ../../utils/adsblock.nix
      ../../utils/random-option.nix
      ../../utils/home-manager-commons.nix

      (import ../../modules/one-command-update.nix { path = "/home/psuwala/nixos"; host="cheap-pussy"; })
      
    ];

    services.gnome.core-utilities.enable = false;
    services.gnome.tracker-miners.enable = false;
}
