{pkgs, lib, ...}:{
  services.node-red = { enable = true; port = 1337; openFirewall = true; 
    configFile = "${pkgs.nodePackages.node-red}/lib/node_modules/node-red/settings.js";
    package = pkgs.runCommand "node-red" {
      nativeBuildInputs = [ pkgs.makeWrapper ];
    }
    ''
      mkdir -p $out/bin
      makeWrapper ${pkgs.nodePackages.node-red}/bin/node-red $out/bin/node-red \
        --set PATH '${lib.makeBinPath [ pkgs.nodePackages.npm pkgs.gcc pkgs.bash pkgs.coreutils pkgs.nodePackages.nodejs]}:$PATH' \
    '';
  };
}
