{
  inputs =
    {
      disko.url = "https://github.com/nix-community/disko/archive/master.tar.gz";
      sops-nix.url = "github:Mic92/sops-nix";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
      unpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/release-23.11";
      };
    };
  outputs = inputs@{ self, nixpkgs, unpkgs, home-manager, sops-nix, disko, ... }: {
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
  };
}
