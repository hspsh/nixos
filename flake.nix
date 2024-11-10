{
  inputs =
    {
      disko.url = "https://github.com/nix-community/disko/archive/master.tar.gz";
      sops-nix.url = "github:Mic92/sops-nix";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      unpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/master";
      };
      rpi5.url = "gitlab:vriska/nix-rpi5";
    };
  outputs = inputs@{ self, rpi5, nixpkgs, unpkgs, home-manager, sops-nix, disko, ... }: {
    nixosConfigurations.pussy-destroyer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit unpkgs; };
      modules = [
        ./host/pussy-destroyer
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
      ];
    };
    nixosConfigurations.pussy-server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit unpkgs; };
      modules = [
        ./host/pussy-server
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
      ];
    };
    nixosConfigurations.images = let
        create = import ./utils/create-system.nix;
    in {
        rpi5Card = (create nixpkgs "aarch64-linux" ( {pkgs, modulesPath, ...}:
            {
                imports = [ (modulesPath + "/installer/cd-dvd/sd-image-aarch64.nix") ];
                boot.kernelPackages = rpi5.legacyPackages.aarch64-linux.linuxPackages_rpi5;
                boot.supportedFilesystems.zfs = nixpkgs.lib.mkForce false;
            }
        )).config.system.build.sdImage;
    };
  };
}
