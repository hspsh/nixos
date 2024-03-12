{ pkgs }: {
  enablePort = [ 8080 ];
  packages = with pkgs; [ k3s fluxcd ];
  services = {
    k3s = {
      enable = true;
      role = "server";
    };
  };
}
