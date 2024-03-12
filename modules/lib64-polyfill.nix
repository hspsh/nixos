{ pkgs, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    attr
    libglvnd
    libz
    fuse
    zstd
    sbclPackages.zstd
  ];
}
