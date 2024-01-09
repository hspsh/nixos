{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    inkscape
    gimp
    k40-whisperer
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
