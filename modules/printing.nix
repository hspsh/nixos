{ pkgs, ... }: {
  services.printing.enable = true;

  services.printing.drivers = with pkgs;[
    gutenprint
    gutenprintBin

    hplip
    hplipWithPlugin
    postscript-lexmark
    samsung-unified-linux-driver
    splix
    brlaser
    brgenml1lpr
    cnijfilter2
  ];
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
