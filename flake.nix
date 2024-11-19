{
  inputs =
    {
      disko.url = "https://github.com/nix-community/disko/archive/master.tar.gz";
      sops-nix.url = "github:Mic92/sops-nix";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      unpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      stable.url = "github:NixOS/nixpkgs/nixos-24.05";
      hardware.url = "github:NixOS/nixos-hardware/master";
      home-manager = {
        url = "github:nix-community/home-manager/master";
      };
      pi.url = "github:nix-community/raspberry-pi-nix";
    };
  outputs = { pi, nixpkgs, unpkgs, stable, home-manager, sops-nix, disko, ... }: {
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
    nixosConfigurations.rpi5 = stable.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        pi.nixosModules.raspberry-pi
        (import ./utils/pi5.nix)
        ./utils/hackerspace.nix
        # ./modules/graphics.nix
        # ./modules/i3.nix
      ];
    };
    nixosConfigurations.rpi4 = stable.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./utils/pi.nix
        ./utils/hackerspace.nix
      ];
    };
  };
}
