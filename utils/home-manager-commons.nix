{ config, pkgs, lib, types, ... }:
let
    recursiveType = lib.mkOptionType {
      name = "recursiveType";
      check = x: true;
      merge = loc: defs: lib.mkMerge (builtins.map (x: x.value) defs);
    };
in
with lib.types;
{
  options = {
    home-manager-commons = pkgs.lib.mkOption {
      description = "Options for all users";
      type = recursiveType;
    };
    home-manager-all = pkgs.lib.mkOption {
      description = "Options for all users et toi root";
      type = recursiveType;
    };
    home-manager-root = pkgs.lib.mkOption {
      description = "Options only for root";
      type = recursiveType; 
    };
  };

  config = {
    home-manager.users.psuwala = lib.mkMerge [ config.home-manager-all config.home-manager-commons ];
    home-manager.users.root = lib.mkMerge [ config.home-manager-all config.home-manager-root ];
  };
}
