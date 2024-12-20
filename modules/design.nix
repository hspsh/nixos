{ pkgs, unpkgs, ... }: {
  environment.systemPackages = [
    pkgs.inkscape
    pkgs.gimp
    pkgs.k40-whisperer
    pkgs.openscad
    unpkgs.legacyPackages.x86_64-linux.orca-slicer

    pkgs.pandoc
    pkgs.texlive.combined.scheme-full
    pkgs.graphviz
    pkgs.plantuml

    pkgs.google-fonts
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    roboto
    roboto-mono
    roboto-serif
  ];
}
