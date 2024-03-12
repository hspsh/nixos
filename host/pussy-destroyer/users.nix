{ pkgs, ... }:
{
  users.users.psuwala = {
    isNormalUser = true;
    description = "Piotr Suwala";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFGHX76mgcCWWeUFNogAFB4OY632sfBX/ylDG1bKuj/J psuwala@fedora.local" ];
  };
  users.defaultUserShell = pkgs.zsh;
}
