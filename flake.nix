{
  inputs =
    {
      disko.url = "https://github.com/nix-community/disko/archive/master.tar.gz";
      sops-nix.url = "github:Mic92/sops-nix";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      unpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      hardware.url = "github:NixOS/nixos-hardware/master";
      home-manager = {
        url = "github:nix-community/home-manager/master";
      };
      pi.url = "github:nix-community/raspberry-pi-nix";
    };
  outputs = inputs@{ self, pi, nixpkgs, unpkgs, home-manager, sops-nix, disko, ... }: {
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
    nixosConfigurations.rpi5 = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit unpkgs; };
      modules = [
        pi.nixosModules.raspberry-pi
        ./utils/pi5.nix
      ];
    };
  };
}
