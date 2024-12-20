{ pkgs, ... }@args: {
  nixpkgs.overlays = [
    (final: super: {
      makeModulesClosure = x:
        super.makeModulesClosure (x // { allowMissing = true; });
    })
  ];

  raspberry-pi-nix.board = "bcm2712";

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
  users.users.root.password = "password1";
  networking.wireless.networks = {
    eduram = {
      psk = "zarazcipodam";
    };
  };
} 
