{ config, ... }:
derivation {
  name = "openvpn";
  system = "x86_64-linux";
  builder = "${config.system-path}/bin/bash";
}
