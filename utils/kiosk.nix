{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    mpv
  ];

  services.cage = {
    enable = true;
    program = "${pkgs.firefox}/bin/firefox https://hsp.sh";
    user = "hsp";
  };
}
