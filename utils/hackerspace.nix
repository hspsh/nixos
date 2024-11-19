{ pkgs, lib, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "yes";
    };
  };
  environment.systemPackages = [ pkgs.neovim ];
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
    
  users.users.hsp = {
    password = "pusia1";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.users.root.password = "pusia1";
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFGHX76mgcCWWeUFNogAFB4OY632sfBX/ylDG1bKuj/J psuwala@fedora.local" ];
  
  networking.networkmanager.enable = lib.mkForce false; 
  networking.wireless.enable = true;
  networking.wireless.networks = {
    eduram = {
      psk = "zarazcipodam";
    };
  };
}
