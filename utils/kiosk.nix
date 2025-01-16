{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    chromium
    mpv
  ];

  services.cage = {
    enable = true;
    program = "${pkgs.chromium} https://hsp.sh";
  };
}
