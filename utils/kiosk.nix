{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    chromium
    mpv
  ];

  services.cage = {
    enable = true;
    program = "${pkgs.chromium}/bin/chromium https://hsp.sh";
    user = "hsp";
  };
}
