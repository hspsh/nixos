url : { pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    mpv
  ];

  services.cage = {
    enable = true;
    program = "${pkgs.firefox}/bin/firefox --setDefaultBrowser --kiosk ${url}";
    user = "hsp";
  };
}
