{ config, pkgs, ... }:
{
  options = {
    foo = pkgs.lib.mkOption {
      description = "...";
    };
  };
}
