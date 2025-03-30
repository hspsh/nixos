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
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
    
  users.users.hsp = {
    password = "pusia1";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.users.root.password = "pusia1";
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFGHX76mgcCWWeUFNogAFB4OY632sfBX/ylDG1bKuj/J psuwala@fedora.local" ];
  
  networking.networkmanager.enable = lib.mkForce false; 
  networking.wireless.userControlled.enable = true;
  users.extraUsers.hsp.extraGroups = [ "wheel" ];

  networking.wireless = {
    enable = true;
    networks."eduram".psk = "zarazcipodam";
    extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
    # output ends up in /run/wpa_supplicant/wpa_supplicant.conf
  };

  systemd.services.wpa_supplicant = {
    enable = true;
    wantedBy = lib.mkForce [ "cage-tty1.service" ];
    before = lib.mkForce [ "cage-tty1.service" ];
  };

  environment.systemPackages = [ pkgs.wpa_supplicant pkgs.neovim pkgs.networkmanager ];
}
