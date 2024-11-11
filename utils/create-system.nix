nixpkgs: system: extend: nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ({ pkgs, modulesPath, ... }@args: {
            # imports = [ (modulesPath + path) ];
            
            # boot.kernelPackages = pkgs.linuxPackages_rpi4;
            # boot.kernelPackages = rpi5.legacyPackages.aarch64-linux.linuxPackages_rpi5;
            
            # could change package to zfs_2_2 but who cares for zfs lol
            nixpkgs.overlays = [
                (final: super: {
                    makeModulesClosure = x:
                      super.makeModulesClosure (x // { allowMissing = true; });
                  })
            ];
            
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
          } // extend args )
        ];
      }
