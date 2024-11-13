{ pkgs, lib, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/sd-card/sd-image-aarch64.nix") ];
  boot.kernelPackages = pkgs.linuxPackages_rpi4;
  boot.supportedFilesystems.zfs = lib.mkForce false;

  nixpkgs.overlays = [
    (final: super: {
      makeModulesClosure = x:
        super.makeModulesClosure (x // { allowMissing = true; });
    })
  ];
} 
