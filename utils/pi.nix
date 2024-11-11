{ pkgs, ... }: {
  # imports = [ (modulesPath + path) ];

  # boot.kernelPackages = pkgs.linuxPackages_rpi4;
  # boot.kernelPackages = rpi5.legacyPackages.aarch64-linux.linuxPackages_rpi5;

  # could change package to zfs_2_2 but who cares for zfs lol
  # nixpkgs.overlays = [
  #   (final: super: {
  #     makeModulesClosure = x:
  #       super.makeModulesClosure (x // { allowMissing = true; });
  #   })
  # ];

  raspberry-pi-nix.board = "bcm2712";
} 
