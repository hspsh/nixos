{ config, pkgs, ... }: {
  imports = [ ../utils/home-manager-commons.nix ];

  home-manager.users.psuwala.home.file.".config/i3/config".text = ''
    ${builtins.readFile ./i3/config} 
  '';

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    nm-tray
    networkmanager
    rofimoji
    imagemagick
    gnome.gnome-terminal
  ];
}
